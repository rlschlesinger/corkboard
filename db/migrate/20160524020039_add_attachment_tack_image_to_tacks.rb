class AddAttachmentTackImageToTacks < ActiveRecord::Migration
  def self.up
    change_table :tacks do |t|
      t.attachment :tack_image
    end
  end

  def self.down
    remove_attachment :tacks, :tack_image
  end
end
