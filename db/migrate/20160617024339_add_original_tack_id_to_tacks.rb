class AddOriginalTackIdToTacks < ActiveRecord::Migration
  def change
    add_column :tacks, :original_tack_id, :integer
  end
end
