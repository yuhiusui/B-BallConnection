class AddLatitudesToCourts < ActiveRecord::Migration[5.2]
  def change
    add_column :courts, :latitude, :float
    add_column :courts, :longitude, :float
  end
end
