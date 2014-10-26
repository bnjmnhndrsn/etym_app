class WordEtymology < ActiveRecord::Base
  belongs_to(
    :etymology,
    class_name: "Etymology",
    foreign_key: :etymology_id,
    primary_key: :id
  )
  
  belongs_to(
    :word,
    class_name: "Word",
    foreign_key: :word_id,
    primary_key: :id
  )
  
  def self.join_word_to_etymology!(word, etymology, distance)
    self.create!(word_id: word.id, etymology_id: etymology.id, distance: distance)
  end
end