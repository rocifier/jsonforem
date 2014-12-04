class CreateJsonforemTopics < ActiveRecord::Migration
  def change
    create_table :jsonforem_topics do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
