class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :player_id, null: false
      t.integer :court_id, null: false
      t.timestamps
    end
    add_index :favorites, :player_id
    add_index :favorites, :court_id
  end
end
