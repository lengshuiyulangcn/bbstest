class RemoveColumnUseridFromUserinfos < ActiveRecord::Migration
  def up
    remove_column :userinfos, :userid
  end

  def down
    add_column :userinfos, :userid, :integer
  end
end
