class Movie < ApplicationRecord
    searchkick
    has_many :movie_actors
    has_many :actors, through: :movie_actors
end
