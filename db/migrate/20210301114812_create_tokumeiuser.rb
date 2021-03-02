class CreateTokumeiuser < ActiveRecord::Migration[6.1]
  def change
    create_table :tokumeiusers do |t|
      t.string :display_name
      t.belongs_to :account, null: false, foreign_key: true
      t.timestamps
    end
  end
end
