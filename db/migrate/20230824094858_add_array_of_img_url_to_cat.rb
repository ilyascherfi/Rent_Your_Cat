class AddArrayOfImgUrlToCat < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :images_url, :text, array: true, default: []
  end
end
