class CreateLanguage < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :code
      t.string :name
      t.timestamps
    end
    
    add_column :etymologies, :language_code, :string
    add_column :words, :language_code, :string
    remove_column :etymologies, :lang
    remove_column :words, :lang
  end
end
