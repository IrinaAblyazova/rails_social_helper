# frozen_string_literal: true

class Admin::SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      user_sign_in(user)
      redirect_to admin_users_path
    else
      render action: :new
    end
  end

  def destroy
    user_sign_out
    redirect_to new_admin_session_path
  end
end