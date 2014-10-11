require 'securerandom'

FactoryGirl.define do
  
  factory :etymology do
    headword { (0...6).map { ('a'..'z').to_a[rand(26)] }.join }
    lang "foo"
  end
  
  factory :a_word, class: Word do
    content { (0...6).map { ('a'..'z').to_a[rand(26)] }.join }
    lang "foo"
    etymology
  end
end