class Public::NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(10)
    @notifications.where(check: false).each do |notification|
      notification.update(check: true)
    end
  end

  def destroy
    notification = current_user.passive_notifications.find(params[:id])
    notification.destroy
    redirect_to notifications_path
  end

  def destroy_all
    notifications = current_user.passive_notifications
    notifications.destroy_all
    redirect_to notifications_path
  end
end
