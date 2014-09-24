class Etymology < ActiveRecord::Base
  def to_param
    headword
  end
end
