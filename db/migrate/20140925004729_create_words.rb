class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :content
      t.string :lang
      t.integer :distance
      t.integer :etymology_id


      t.timestamps
    end
    
    add_index :words, [:etymology_id, :distance]
  end
end
