class AddPostsToJsonforemPosts < ActiveRecord::Migration
  def change
    add_reference :jsonforem_posts, :posts, index: true
  end
end
