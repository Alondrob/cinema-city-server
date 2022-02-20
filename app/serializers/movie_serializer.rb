class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :director, :image, :actor_id, :plot, :year,
  :movie_length, :rating

  has_many :actors
end
