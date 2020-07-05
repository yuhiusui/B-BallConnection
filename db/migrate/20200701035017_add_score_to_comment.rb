class AddScoreToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :score, :decimal, precision: 5, scale: 3
    add_column :reviews, :score, :decimal, precision: 5, scale: 3
  end
end
