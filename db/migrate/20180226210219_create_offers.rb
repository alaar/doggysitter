class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true
      t.integer :price
      t.string :location
      t.string :date_time

      t.timestamps
    end
  end
end
