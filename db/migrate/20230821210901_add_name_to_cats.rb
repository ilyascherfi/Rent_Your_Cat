class AddNameToCats < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :name, :string
  end
end
