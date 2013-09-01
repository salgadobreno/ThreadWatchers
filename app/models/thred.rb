class Thred
  include Mongoid::Document

  #field :_id, type: String, default: lambda { title.to_s.parameterize } TODO:
  #not playing nice with FactoryGirl
  field :title, type: String
  field :description, type: String

  validates :title, :presence => true

  embeds_many :posts, order: :start.desc

end
