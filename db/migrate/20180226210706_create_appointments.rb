class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :offer, foreign_key: true
      t.string :status, :default => "pending"

      t.timestamps
    end
  end
end
