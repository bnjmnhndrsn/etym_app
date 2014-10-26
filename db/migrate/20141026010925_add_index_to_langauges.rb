class AddIndexToLangauges < ActiveRecord::Migration
  def change
    add_index :languages, :code, unique: :true
    add_index :etymologies, [:headword, :language_code], unique: :true
  end
end
