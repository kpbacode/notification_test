class Client < ApplicationRecord
  has_many :notification_clients
  has_many :notifications, through: :notification_clients
end
