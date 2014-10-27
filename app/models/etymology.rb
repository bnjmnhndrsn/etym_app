class Etymology < ActiveRecord::Base
  validates :headword, presence: true
  
  has_many(
    :word_etymologies,
    class_name: "WordEtymology",
    foreign_key: :etymology_id,
    primary_key: :id
  )
  
  belongs_to(
    :language,
    class_name: "Language",
    foreign_key: :language_code,
    primary_key: :code
  )
  
  def words
    Word
    .select("words.*, word_etymologies.distance")
    .joins(:word_etymologies)
    .where("word_etymologies.etymology_id = ?", self.id)
    .order("word_etymologies.distance DESC")
  end
  
  
  def to_param
    headword
  end
end
