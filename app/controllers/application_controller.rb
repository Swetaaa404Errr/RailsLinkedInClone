# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  before_action :set_query

  def set_query
    @q = User.ransack(params[:q])
  end

  def set_current_user
    return unless session[:user_id]

    @current_user = User.find_by(id: session[:user_id])
  end

  def set_current_job
    @c_user_account = UserAccount.select { |u| (u.user_id == @current_user.id) }
  end

  def logged_in?
    !!set_current_user
  end

  def admin?
    set_current_user.try(:admin)
  end

  def require_admin
    return if admin?

    flash[:alert] = 'You are not authorized to perform this action'
    redirect_to sign_in_path
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'You must be signed in to do that.' if @current_user.nil?
  end

  def clear_flash_message
    flash[:alert] = nil
  end
end
