class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :tack
  validates_uniqueness_of :tack_id, scope: :user_id
end
