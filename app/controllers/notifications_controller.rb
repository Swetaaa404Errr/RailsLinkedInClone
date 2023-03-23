class NotificationsController < ApplicationController
    before_action :set_current_user 

    def destroy
    
    @notification = Notification.find(params[:id])
    if @notification.destroy
    redirect_to request.referer, notice: 'Notification Deleted'
    end
    end

end