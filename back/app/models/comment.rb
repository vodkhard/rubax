class Comment < ApplicationRecord
  validates_presence_of :message, :post_id, :user_id

  belongs_to :post
  belongs_to :user
end
