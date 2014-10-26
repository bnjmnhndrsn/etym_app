class WordEtymology < ActiveRecord::Base
  belongs_to :etymology
  
  belongs_to :word
  
  default_scope -> { order('distance DESC') }
  
  def self.join_word_to_etymology!(word, etymology, distance)
    self.create!(word_id: word.id, etymology_id: etymology.id, distance: distance)
  end
end