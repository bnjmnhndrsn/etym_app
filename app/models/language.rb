class Language < ActiveRecord::Base
  has_many(
    :words,
    class_name: "Word",
    primary_key: :code,
    foreign_key: :language_code
  )
  
  has_many(
    :etymologies,
    class_name: "Etymology",
    primary_key: :code,
    foreign_key: :language_code
  )
end