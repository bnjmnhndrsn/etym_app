class CreateEtymologies < ActiveRecord::Migration
  def change
    create_table :etymologies do |t|
      t.string :headword
      t.string :lang

      t.timestamps
    end
    
    add_index :etymologies, :headword, unique: true
  end
end
