class AddBoardIdToTacks < ActiveRecord::Migration
  def change
    add_column :tacks, :board_id, :integer
  end
end
