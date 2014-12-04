class CreateJsonforemPosts < ActiveRecord::Migration
  def change
    create_table :jsonforem_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
