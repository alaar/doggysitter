class AddNameToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :name, :string
  end
end
