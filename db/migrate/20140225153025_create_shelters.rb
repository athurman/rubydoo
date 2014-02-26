class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|

      t.timestamps
    end
  end
end
