class DropShelters < ActiveRecord::Migration
    def up
    drop_table :shelters
  end

  def down
    create_table :shelters do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :name
      t.string   :petfinder_id
      t.string   :longitude
      t.string   :latitude
      t.string   :zip
      t.string   :state
      t.string   :city
      t.string   :address
      t.string   :email
    end
  end
end
