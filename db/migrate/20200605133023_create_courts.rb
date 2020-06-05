class CreateCourts < ActiveRecord::Migration[5.2]
  def change
    create_table :courts do |t|
      t.string  :name,           null: false
      t.integer :number,         null: false, default: 1
      t.string  :floor,          null: false
      t.string  :fee,            null: false, default: "無料"
      t.string  :available_time, null: false, default: "特になし"
      t.string  :station
      t.string  :court_image_id
      t.integer :postal_code,    null: false
      t.integer :prefecture_code,null: false
      t.string  :city,           null: false
      t.string  :street,         null: false
      t.text    :other
      t.boolean :is_valid,       default: true
      t.timestamps
    end
  end
end
