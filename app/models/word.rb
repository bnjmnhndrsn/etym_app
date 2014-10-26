class Word < ActiveRecord::Base 
  has_many(
    :word_etymologies,
    class_name: "WordEtymology",
    foreign_key: :word_id,
    primary_key: :id
  )
  
  
end
