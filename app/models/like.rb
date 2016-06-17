class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :tack
end
