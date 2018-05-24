class AddForumIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :forum_id, :integer
  end
end
