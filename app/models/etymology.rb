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
  
  
  def to_param
    headword
  end
end
