class Tack < ActiveRecord::Base
  validates_presence_of :description
  belongs_to :user
  belongs_to :board
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_attached_file :tack_image, styles: { large: "800X800>", medium: "250x250>", thumb: "100x100>" }
  validates_attachment_content_type :tack_image, content_type: /\Aimage\/.*\Z/

  def repost (edited_tack, user)
    repost_tack = self.dup
    repost_tack.board_id = edited_tack[:board_id]
    repost_tack.user_id = user.id
    repost_tack.original_tack_id = self.id
    repost_tack.tack_image = self.tack_image
    repost_tack.save
  end

  def is_repost?
    original_tack_id.present?
  end

  def original_tack
    Tack.find(original_tack_id) if is_repost?
  end

end
