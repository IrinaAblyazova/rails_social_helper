# frozen_string_literal: true

class Web::User::UserSessionsController < Web::User::ApplicationController
  skip_before_action :authentucate_user!
  def new; end

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      user_sign_in(user)
      redirect_to users_path
    else
      render action: :new
    end
  end

  def destroy
    user_sign_out
    redirect_to new_user_sessions_path
  end
end
