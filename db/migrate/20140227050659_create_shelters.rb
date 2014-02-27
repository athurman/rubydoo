class CreateShelters < ActiveRecord::Migration
def change
    create_table :shelters do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :name
      t.string   :petfinder_id
      t.float   :longitude
      t.float   :latitude
      t.string   :zip
      t.string   :state
      t.string   :city
      t.string   :address
      t.string   :email
    end
  end
end
