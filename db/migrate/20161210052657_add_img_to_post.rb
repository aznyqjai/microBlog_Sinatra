class AddImgToPost < ActiveRecord::Migration[5.0]
  def up
    add_column :posts, :asset_img, :string
  end

  def down
    remove_column :posts, :asset_img
  end
end
