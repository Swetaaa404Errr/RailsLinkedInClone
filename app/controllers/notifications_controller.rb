# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :set_current_user

  def index
    @notify = @current_user.notifies.order(created: :desc)
  end

  def destroy
    @notification = Notification.find(params[:id])
    return unless @notification.destroy

    redirect_to request.referer, notice: 'Notification Deleted'
  end
end
