# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :set_current_user

  def index
    @notifications = @current_user.notifications.latest_first
    @notifies = @current_user.notifies.where("id IN (
      SELECT MIN(id) FROM notifies WHERE user_id = ? GROUP BY job_navigation_id
    )", @current_user.id).latest_first
  end

  def destroy
    @notification = Notification.find(params[:id])
    return unless @notification.destroy

    redirect_to request.referer, notice: 'Notification Deleted'
  end
end
