class AddFlouridToComments < ActiveRecord::Migration
  def change
    add_column :comments, :flour_id, :integer
  end
end
