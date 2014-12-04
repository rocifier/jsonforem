module Jsonforem
  class Forum < ActiveRecord::Base
    has_many :topics 
    belongs_to :category
  end
end
