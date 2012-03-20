class ChangeUserIdToGather < ActiveRecord::Migration
  def up
    change_column :gathers, :user_id, :integer
  end

  def down
    change_column :gathers, :user_id, :string
  end
end
