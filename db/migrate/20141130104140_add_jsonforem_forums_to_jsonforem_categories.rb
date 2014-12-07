class AddJsonforemForumsToJsonforemCategories < ActiveRecord::Migration
  def change
    add_reference :jsonforem_forums, :jsonforem_categories, index: true
  end
end
