class AddPostsToJsonforemTopics < ActiveRecord::Migration
  def change
    add_reference :jsonforem_topics, :posts, index: true
  end
end
