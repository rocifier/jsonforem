class AddJsonforemPostsToJsonforemTopics < ActiveRecord::Migration
  def change
    add_reference :jsonforem_posts, :jsonforem_topics, index: true
  end
end
