class User::PasswordController < ApplicationController
  skip_before_action :authenticate_request, only: :forgot_passwd
  def forgot_passwd
    if params[:email].blank?
      return render json: {error: 'Email not present'}
    end
    email = params[:email]
    user = User.find_by(email: email.downcase)
    
    if user.present?
      user.generate_password_token!
      SendMailJob.set(wait: 5.seconds).perform_now(user)
      render json: {status: 'ok'}, status: :ok
    else
      render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
    end
  end
end
