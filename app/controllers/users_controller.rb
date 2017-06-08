class UsersController < ApplicationController
  before_action :admin_user,     only: :destroy

  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Matchup!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  #CONTROLLER
  def toggle_approve
    @user = User.find(params[:id])
    @user.toggle!(:admin)
      respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Admin status successfully changed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end
end
