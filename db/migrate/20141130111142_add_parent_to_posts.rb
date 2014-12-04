class AddParentToPosts < ActiveRecord::Migration
  def change
    add_reference :jsonforem_posts, :jsonforem_posts, index: true
  end
end
