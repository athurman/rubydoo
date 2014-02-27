class AddLatitudeAndLongitudeToShelter < ActiveRecord::Migration
  def change
    add_column :shelters, :latitude, :float
    add_column :shelters, :longitude, :float
  end
end
