class DiscSerializer < ActiveModel::Serializer
  attributes :id, :title, :amazon_url
  has_many :movies
end
