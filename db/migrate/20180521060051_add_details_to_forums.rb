class AddDetailsToForums < ActiveRecord::Migration[5.1]
  def change
    add_column :forums, :name, :string
    add_column :forums, :title, :string
  end
end
