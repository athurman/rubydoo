class AddEmailToShelters < ActiveRecord::Migration
  def change
    add_column :shelters, :email, :string
  end
end
