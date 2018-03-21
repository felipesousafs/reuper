class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :destroy]
  load_and_authorize_resource

  def index
    @notifications = current_user.notifications
  end

  def new
    @notification = Notification.new
    @notification.subject = 'Solicitação de troca em tabela de tarefa.'
    @notification.user_id = @trash.user_id
    @notification.from = id
    @notification.task_id = @trash.id
    @notification.table_type = @table_type
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def create
    @notification = Notification.new(course_params)

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

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_notification
    @notification = Notification.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def notification_params
    params.require(:notification).permit(:from, :type, :description, :subject, :task_type, :task_id, :read, :user_id, :trash_id)
  end
end
