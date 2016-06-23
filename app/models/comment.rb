class Comment < ActiveRecord::Base
  belongs_to :tack
  belongs_to :user
end
