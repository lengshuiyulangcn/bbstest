class AddColumnClickedToPassages < ActiveRecord::Migration
  def change
    add_column :passages, :clicked, :integer,:default => 0
  end
end
