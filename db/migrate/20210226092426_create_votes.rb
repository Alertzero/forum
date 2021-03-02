class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :account, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.boolean :upvote

      t.timestamps
    end
  end
end
