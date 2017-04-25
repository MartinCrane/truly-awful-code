class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :account, foreign_key: true
      t.belongs_to :post, foreign_key: true

      t.timestamps
    end
    add_index :votes, [:account_id, :post_id], unique: true
  end
end
