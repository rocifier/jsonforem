module Jsonforem
  class Category < ActiveRecord::Base
    has_many :forums
  end
end
