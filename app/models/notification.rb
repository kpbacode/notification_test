class Notification < ApplicationRecord
  has_many :notification_clients
  has_many :clients, through: :notification_clients
end
