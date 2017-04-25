class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    enable_extension :citext
    create_table :accounts do |t|
      t.citext :username
      t.string :password_digest

      t.timestamps
    end
    add_index :accounts, :username, unique: true
  end
end
