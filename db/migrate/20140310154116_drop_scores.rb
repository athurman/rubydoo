class DropScores < ActiveRecord::Migration
  def up
    drop_table :scores
  end
end
