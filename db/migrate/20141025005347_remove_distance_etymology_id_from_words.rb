class RemoveDistanceEtymologyIdFromWords < ActiveRecord::Migration
  def change
    remove_column :words, [:distance, :etymology_id]
  end
end
