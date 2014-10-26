class RemoveDistanceFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :distance
    remove_column :words, :etymology_id
  end
end
