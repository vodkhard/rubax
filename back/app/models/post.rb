class Post < ApplicationRecord
  validates_presence_of :title, :content, :post_type, :user_id, :category_id

  has_many :comments
  has_many :upvotes
  belongs_to :user
  belongs_to :category
end
