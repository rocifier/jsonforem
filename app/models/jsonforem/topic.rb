module Jsonforem
  class Topic < ActiveRecord::Base
    has_many :posts
    belongs_to :forum
    validates :forum_id, presence: true
  end
end
