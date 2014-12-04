module Jsonforem
  class Forum < ActiveRecord::Base
    has_many :topics 
    belongs_to :category
    validates :jsonforem_categories_id, presence: true
  end
end
