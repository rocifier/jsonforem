class CreateJsonforemForums < ActiveRecord::Migration
  def change
    create_table :jsonforem_forums do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
