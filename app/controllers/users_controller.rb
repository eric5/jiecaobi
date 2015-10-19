class UsersController < ApplicationController
  before_filter :authenticate_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thanks for registering JCB, please sign in."
      redirect_to sign_in_path
    else
      flash[:error] = "Please check your input."
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update_attribute(:name, user_params[:name])
    flash[:success] = "Your name has been changed."
    render :edit
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
