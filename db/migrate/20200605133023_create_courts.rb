class CreateCourts < ActiveRecord::Migration[5.2]
  def change
    create_table :courts do |t|
      t.string  :name,           null: false
      t.integer :number,         null: false, default: 1
      t.string  :floor,          null: false
      t.string  :fee,            null: false, default: "無料"
      t.string  :available_time, null: false, default: "特になし"
      t.string  :station,        null: false
      t.string  :parking,        null: false
      t.text    :url
      t.string  :court_image_id
      t.integer :postal_code
      t.integer :prefecture_code
      t.string  :city
      t.string  :street
      t.text    :address
      t.text    :other
      t.boolean :is_valid,       default: true
      t.timestamps
    end

    add_index :courts, :id
    add_index :courts, :name
  end
end
