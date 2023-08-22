class AddPriceToCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :price, :integer
  end
end
