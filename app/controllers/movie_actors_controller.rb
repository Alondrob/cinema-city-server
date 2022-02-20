class MovieActorsController < ApplicationController


    def index
        movie = Movie.find(params[:movie_id])
        render json: movie.movie_actors
    end
end
