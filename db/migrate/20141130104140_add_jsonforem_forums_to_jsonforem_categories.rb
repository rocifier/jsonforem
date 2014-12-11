class AddForumsToJsonforemCategories < ActiveRecord::Migration
  def change
    add_reference :jsonforem_categories, :forums, index: true
  end
end
