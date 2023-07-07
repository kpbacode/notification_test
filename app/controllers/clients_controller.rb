
class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_client, only: [:show]

  def index
    @clients = Client.all
    render json: @clients
  end

  def show
    render json: @client
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end


  def set_client
    @client = Client.find(params[:id])
  end
end
