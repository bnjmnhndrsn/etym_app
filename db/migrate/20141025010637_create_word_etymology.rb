class CreateWordEtymology < ActiveRecord::Migration
  def change
    create_table :word_etymologies do |t|
      t.integer :word_id
      t.integer :etymology_id
      t.integer :distance
      t.timestamps
    end
    
    add_index :word_etymologies, :word_id
    add_index :word_etymologies, :etymology_id
  end
end
