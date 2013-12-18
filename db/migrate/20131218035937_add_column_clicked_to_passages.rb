class AddColumnClickedToPassages < ActiveRecord::Migration
  def change
    add_column :passages, :clicked, :integer
  end
end
