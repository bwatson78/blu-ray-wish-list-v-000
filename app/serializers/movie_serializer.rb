class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :imdb_url
end
