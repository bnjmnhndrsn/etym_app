class Word < ActiveRecord::Base
  belongs_to :etymology
  validates :etymology, presence: true
  validates :content, presence: true
  before_save { self.distance = self.etymology.words.count }
end
