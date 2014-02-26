class AddPetfinderIdToShelters < ActiveRecord::Migration
  def change
    add_column :shelters, :petfinder_id, :string
  end
end
