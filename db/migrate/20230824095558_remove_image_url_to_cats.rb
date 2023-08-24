class RemoveImageUrlToCats < ActiveRecord::Migration[7.0]
  def change
    remove_column :cats, :image_url
  end
end
