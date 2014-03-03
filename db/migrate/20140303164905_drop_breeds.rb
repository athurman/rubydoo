class DropBreeds < ActiveRecord::Migration
  def up
    drop_table :breeds
  end
end
