class Etymology < ActiveRecord::Base
  validates :headword, presence: true
  
  has_many(
    :word_etymologies,
    class_name: "WordEtymology",
    foreign_key: :etymology_id,
    primary_key: :id
  )
  
  
  
  def to_param
    headword
  end
end
