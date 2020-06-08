class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :player_id, null: false
      t.integer :court_id, null: false
      t.text :comment, null: false
      t.timestamps
    end
    add_index :comments, :player_id
    add_index :comments, :court_id
  end
end
