class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :shelters, :latitude
  end
end
