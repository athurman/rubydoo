class AddLongitudeToShelters < ActiveRecord::Migration
  def change
    add_column :shelters, :longitude, :string
  end
end
