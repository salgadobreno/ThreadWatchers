class Thred
  include Mongoid::Document

  #field :_id, type: String, default: lambda { name.to_s.parameterize } TODO:
  #not playing nice with FactoryGirl
  field :name, type: String
  field :description, type: String

  validates :name, :presence => true

  embeds_many :posts

end
