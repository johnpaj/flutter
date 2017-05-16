class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    # index by posts by user id and created at. Index gives very rapid lookup time and space in the database
    add_index :posts, [:user_id, :created_at]
  end
end
