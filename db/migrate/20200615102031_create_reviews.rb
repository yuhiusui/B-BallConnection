class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :court, foreign_key: true
      t.references :player, foreign_key: true
      t.string :rv_title, null: false
      t.text :rv_body, null: false
      t.float :rate, null: false, default: 0
      t.string :rv_image
      t.timestamps
    end
  end
end
