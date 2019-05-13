class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :published, :image, :created_at, :updated_at, :upvotes
  belongs_to :user
  belongs_to :category
  has_many :comments

  def upvotes
    object.upvotes.size
  end
end