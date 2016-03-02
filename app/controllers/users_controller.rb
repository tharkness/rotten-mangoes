class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if current_user.admin?
        redirect_to admin_users_path
      else
        session[:user_id] = @user.id
        redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
      end
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.reviews.destroy
    @user.destroy
    redirect_to admin_users_path
  end

  def index
    @pages_users = User.order("email").page(params[:page])
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end
