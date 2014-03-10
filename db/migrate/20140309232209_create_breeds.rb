class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :size
      t.string :lifespan
      t.string :weight
      t.string :height
      t.string :group
      t.string :exercise
      t.string :grooming
      t.string :family_friendly
      t.string :role
      t.text   :temperament
      t.string :image
      t.timestamps
    end
  end
end
