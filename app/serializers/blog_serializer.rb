class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
end
