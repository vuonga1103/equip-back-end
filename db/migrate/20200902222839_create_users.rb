class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :city
      t.string :state
      t.integer :zip
      t.string :email

      t.timestamps
    end
  end
end
