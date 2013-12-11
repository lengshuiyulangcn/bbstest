class AddColumnPrToUserinfos < ActiveRecord::Migration
  def change
    add_column :userinfos, :pr, :string
  end
end
