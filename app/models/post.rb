class Post
  include Mongoid::Document

  field :title, type: String
  field :description, type: String
  field :link, type: String
  field :start, type: DateTime

  #TODO add image

  validates :title, :link, :start, :presence => true

  embedded_in :thred

end
