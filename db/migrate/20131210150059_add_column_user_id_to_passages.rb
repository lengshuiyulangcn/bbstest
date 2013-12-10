class AddColumnUserIdToPassages < ActiveRecord::Migration
  def change
    add_column :passages, :user_id, :integer
  end
end
