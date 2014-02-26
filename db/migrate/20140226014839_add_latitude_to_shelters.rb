class AddLatitudeToShelters < ActiveRecord::Migration
  def change
    add_column :shelters, :latitude, :string
  end
end
