class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :destroy]

  def index
    @notifications = current_user.notifications
    if params[:q]
      @notification = Notification.find(params[:q])
    end
  end

  def new
    @notification = Notification.new
    id = params[:id]
    table = params[:table]
    @trash = Trash.find(id)
    @user = current_user
    @notification.subject = 'Solicitação de troca em tabela de tarefa.'
    @notification.user_id = @trash.user_id
    @notification.from = @user.id
    @notification.task_id = id
    @notification.read = false
    @notification.table_type = table
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html {redirect_to home_tarefas_url, notice: 'Sua solicitação de troca foi enviada ao reseidente selecionado. Você será informado quando ele aceitar ou recusar a troca.'}
        format.json {head :no_content}
      else
        format.html {}
        format.json {render json: @notification.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html {redirect_to :back}
      format.json {head :no_content}
    end
  end

  def notification_response
    @notification = Notification.find(params[:id])
    @resp = params[:resp]
    @task_id = @notification.task_id
    if @notification.table_type == 'trash'
      @trash = Trash.find(@task_id)
      @trash.swap(@notification, @resp)
      respond_to do |format|
        format.html { redirect_to notifications_path, notice: 'Troca realizada com sucesso.'}
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_notification
    @notification = Notification.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def notification_params
    params.require(:notification).permit(:from, :task_type, :description, :subject, :task_id, :read, :user_id, :trash_id, :trash_user_id, :table_type)
  end
end
