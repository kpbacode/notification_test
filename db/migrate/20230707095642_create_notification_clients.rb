class CreateNotificationClients < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_clients do |t|
      t.references :notification, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
