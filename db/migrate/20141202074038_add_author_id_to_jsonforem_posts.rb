class AddAuthorIdToJsonforemPosts < ActiveRecord::Migration
  def change
    add_column :jsonforem_posts, :user_id, :integer
  end
end
