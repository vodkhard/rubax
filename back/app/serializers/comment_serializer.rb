class CommentSerializer < ActiveModel::Serializer
  attributes :id, :name, :message
  belongs_to :post
end