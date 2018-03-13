class UsersController < ApplicationController

  # All Users
  def index
    @users = User.order(:name)
    #@users = @users.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.room.users.size < 4
      respond_to do |format|
        if @user.update(user_params)
          format.html {redirect_to @user, notice: 'Quatto atualizado.'}
          format.json {render :show, status: :ok, location: @user}
        else
          format.html {render :edit}
          format.json {render json: @user.errors, status: :unprocessable_entity}
        end
      end
    else
      format.html {render :edit, notice: 'O quarto indicado já possui 4 residentes.'}
      format.json {render json: @user.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Usuário removido com sucesso."
      redirect_to root_path
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :email, :room_id, :course_id, :reg_number)
  end

end
