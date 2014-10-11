# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word do
    content "MyString"
    lang "MyString"
    etymology_id 1
  end
end
