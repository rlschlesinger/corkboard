class Tack < ActiveRecord::Base
  validates_presence_of :description
  belongs_to :user
  has_attached_file :tack_image, styles: { large: "800X800>", medium: "250x250>", thumb: "100x100>" }
  validates_attachment_content_type :tack_image, content_type: /\Aimage\/.*\Z/
end
