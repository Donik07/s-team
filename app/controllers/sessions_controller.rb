# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]

  def new; end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sign_in user
      remember(user) if params[:remember_me] == '1'
      flash[:check] = "Добрый день, #{current_user.first_name}!"
      redirect_to questions_path
    else
      flash[:times] = 'Логин или пароль введён не правильно :('
      render :new
    end
  end

  def destroy
    sign_out
    flash[:check] = 'Будем ждать Вас снова!'
    redirect_to new_session_path
  end
end
