class AddCatidToPassages < ActiveRecord::Migration
  def change
    add_column :passages, :category_id, :integer
  end
end
