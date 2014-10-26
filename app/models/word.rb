class Word < ActiveRecord::Base 
  has_many(
    :word_etymologies,
    class_name: "WordEtymology",
    foreign_key: :word_id,
    primary_key: :id
  )
  
  belongs_to(
    :language,
    class_name: "Language",
    foreign_key: :language_code,
    primary_key: :code
  )
end
