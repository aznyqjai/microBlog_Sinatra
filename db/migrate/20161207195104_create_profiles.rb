class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :hometown, default: ''
      t.string :favorite_color, default: ''
      t.belongs_to :user, index: true
    end
  end
end
