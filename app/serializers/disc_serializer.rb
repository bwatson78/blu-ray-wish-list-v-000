class DiscSerializer < ActiveModel::Serializer
  attributes :id, :title, :amazon_url, :special?, :pressing_year
  has_many :movies
  has_many :user_discs
end
