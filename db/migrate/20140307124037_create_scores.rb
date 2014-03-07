class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :answer_id
      t.integer :breed_id
      t.integer :score

      t.timestamps
    end
  end
end
