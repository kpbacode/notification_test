class NotificationClientsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @notification_client = NotificationClient.new(notification_client_params)

    if @notification_client.save
      render json: @notification_client, status: :created
    else
      render json: @notification_client.errors, status: :unprocessable_entity
    end
  end

  def update
    @notification_client = NotificationClient.find(params[:id])

    if @notification_client.update(notification_client_params)
      render json: @notification_client
    else
      render json: @notification_client.errors, status: :unprocessable_entity
    end
  end

  private

  def notification_client_params
    params.require(:notification_client).permit(:notification_id, :client_id, :seen)
  end
end
