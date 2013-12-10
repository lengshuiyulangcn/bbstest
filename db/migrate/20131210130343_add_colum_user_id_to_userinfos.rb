class AddColumUserIdToUserinfos < ActiveRecord::Migration
  def change
    add_column :userinfos, :userid, :integer
  end
end
