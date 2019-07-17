class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :user_name
  belongs_to :post
  belongs_to :user

  def user_name
    object.user.name
  end
end
