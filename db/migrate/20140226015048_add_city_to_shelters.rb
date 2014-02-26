class AddCityToShelters < ActiveRecord::Migration
  def change
    add_column :shelters, :city, :string
  end
end
