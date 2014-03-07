class AddMoneyToUserinfo < ActiveRecord::Migration
  def change
    add_column :userinfos, :money, :integer
  end
end
