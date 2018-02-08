class User::RegisterController < ApplicationController
  skip_before_action :authenticate_request, only: :sign_up
  
  def sign_up
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, head: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :bio, :name, :picture, :password, :password_confirmation)
  end
end
