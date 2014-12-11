module Jsonforem
  class Forum < ActiveRecord::Base
    has_many :topics 
    belongs_to :category
    validates :category_id, presence: true
  end
end
