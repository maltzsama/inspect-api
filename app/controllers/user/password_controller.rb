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
      # SEND EMAIL HERE
      UserNotifyMailer.forgot_passwd(user).deliver_now
      render json: {status: 'ok'}, status: :ok
    else
      render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
    end
  end

  def update_passwd
  end
end
