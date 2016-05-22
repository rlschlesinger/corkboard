class AddUserIdToTacks < ActiveRecord::Migration
  def change
    add_column :tacks, :user_id, :integer
    add_index :tacks, :user_id
  end
end
