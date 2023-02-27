# frozen_string_literal: true

class PasswordsController < ApplicationController
  before_action :set_current_user

  def edit; end

  def update
    if @current_user.update(password_params)
      redirect_to root_path, notice: 'Password updateed'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
