class Api::SessionsController < ApplicationController
  def create
    @user = User.find_for_database_authentication(email: session_params[:email])
    if @user && @user.valid_password?(session_params[:password])
      render json: { auth_token: @user.auth_token, current_user: @user }
    else
      invalid_login_attempt
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def invalid_login_attempt
    render json: { error: I18n.t('devise.failure.not_found_in_database') }, status: :unauthorized
  end
end
