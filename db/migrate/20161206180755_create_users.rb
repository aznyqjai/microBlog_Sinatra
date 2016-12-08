class CreateUsers < ActiveRecord::Migration[5.0]
  # def up
  #   create_table :users do |t|
  #   t.string :name
  #   end
  # end

  # def down
  #   drop_table :users
  # end

#New way ... change rollls back automatically
  def change
    create_table :users do |t|
      t.string :first_name, default: ''
      t.string :last_name, default: ''
      t.string :email, default: ''
      t.string :password, default: ''

      t.timestamps
    end
  end
end

