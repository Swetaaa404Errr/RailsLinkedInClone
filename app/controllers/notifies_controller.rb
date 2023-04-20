# frozen_string_literal: true

class NotifiesController < ApplicationController
  before_action :set_current_user

  def index
    @notify = @current_user.notifies.order(created: :desc)
  end

  def destroy
    @notify = Notify.find(params[:id])
    return unless @notify.destroy

    redirect_to request.referer, notice: 'Job Notification Deleted'
  end
end
