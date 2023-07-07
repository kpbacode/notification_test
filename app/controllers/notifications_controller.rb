class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_notification, only: [:show]

  def index
    @notifications = Notification.all
    render json: @notifications
  end

  def show
    render json: @notification
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      #
      MockPushService.send(title: "My title", description: "My description", token: "some_unique_device_token")

      render json: @notification, status: :created
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:date, :title, :description)
  end
end
