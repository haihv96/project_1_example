class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :remember_digest
      t.string :full_name, null: false
      t.integer :gender, default: 0

      t.timestamps
    end
  end
end
