class MovieActorSerializer < ActiveModel::Serializer
  attributes :id, :role
  belongs_to :movie
  belongs_to :actor
end
