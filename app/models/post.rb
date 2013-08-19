class Post
  include Mongoid::Document

  field :title, type: String
  field :summary, type: String
  field :url, type: String
  field :date, type: DateTime

  validates :title, :url, :date, :presence => true

end
