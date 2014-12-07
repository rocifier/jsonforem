class AddTopicsToForums < ActiveRecord::Migration
  def change
    add_reference :jsonforem_topics, :jsonforem_forums, index: true
  end
end
