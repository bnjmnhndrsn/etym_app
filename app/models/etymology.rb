class Etymology < ActiveRecord::Base
  has_many :words
  
  validates :headword, presence: true
  
  
  def to_param
    headword
  end
end
