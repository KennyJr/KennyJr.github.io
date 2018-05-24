class CreateForums < ActiveRecord::Migration[5.1]
  def change
    create_table :forums do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :forums, [:user_id, :created_at, :name, :title]
  end
end
