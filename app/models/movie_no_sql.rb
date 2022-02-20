class Movie < ApplicationRecord
    include Mongoid
    searchkick
    has_many :movie_actors
    has_many :actors, through: :movie_actors

    field :name
    field :year
end
