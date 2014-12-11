class AddTopicsToJsonforemForums < ActiveRecord::Migration
  def change
    add_reference :jsonforem_forums, :topics, index: true
  end
end
