class AddZipToShelters < ActiveRecord::Migration
  def change
    add_column :shelters, :zip, :string
  end
end
