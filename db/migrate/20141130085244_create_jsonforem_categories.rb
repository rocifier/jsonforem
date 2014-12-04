class CreateJsonforemCategories < ActiveRecord::Migration
  def change
    create_table :jsonforem_categories do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
