class Thred
  include Mongoid::Document

  field :_id, type: String, default: lambda { name.to_s.parameterize }
  field :name, type: String
  field :description, type: String

  validates :name, :presence => true

  embeds_many :posts

end
