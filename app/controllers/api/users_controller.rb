class Api::UsersController < ApplicationController
  before_action :authenticate_user_from_token!, except: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find params[:id]
    render json: @user
  end

  def create
    @user = User.new user_params
    if @user.save
      render json: { auth_token: @user.auth_token, current_user: @user }
    else
      render json: { error: @user.errors }, status: :unauthorized
    end
  end

  def update; end

  def destroy; end

  protected

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation
    )
  end
end
