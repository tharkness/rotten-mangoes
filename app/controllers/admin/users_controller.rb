class Admin::UsersController < ApplicationController

  before_action :require_admin

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def index
    @pages_users = User.order("email").page(params[:page])
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect 'admin/users'
  end

end
