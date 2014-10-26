class DropIndexFromWords < ActiveRecord::Migration
  def change
    remove_index "words", ["etymology_id", "distance"]
  end
end
