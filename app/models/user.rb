class User < ApplicationRecord
    has_secure_password
    has_many :reviews, dependent: :destroy
    has_many :favorite_movies, dependent: :destroy
    has_many :movies, through: :favorite_movies
end
