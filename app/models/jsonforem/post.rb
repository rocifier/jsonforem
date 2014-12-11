module Jsonforem
  class Post < ActiveRecord::Base
    belongs_to :topic
    belongs_to :user, class_name: Jsonforem.user_class
    has_one :post	#optional: this is the parent post, defining this post as a comment instead of a top-level post.
    validates :topic_id, presence: true

    def owner_or_admin?(other_user)
      user == other_user || other_user.forum_admin?
    end

  end
end
