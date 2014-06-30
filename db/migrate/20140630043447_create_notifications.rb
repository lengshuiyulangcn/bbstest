class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :comment_id
      t.integer :user_id
      t.boolean :unread, :default=> true

      t.timestamps
    end
  end
end
