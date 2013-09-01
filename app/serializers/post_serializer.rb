class PostSerializer < ActiveModel::Serializer
  attributes :title, :description, :link, :start
end
