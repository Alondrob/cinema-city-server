class FavoriteMoviesController < ApplicationController


    def index
        render json: current_user.movies
    end

    def create
        movie = Movie.find(favorite_movie_params[:movie_id])
        favorite_movie = current_user.favorite_movies.find_by(movie: movie)

        if favorite_movie
            favorite_movie.destroy
        else
            FavoriteMovie.create(movie_id: movie.id, user: current_user)
        end
        head :ok
    end

        private 

        def favorite_movie_params
            params.require(:favorite_movie).permit(:movie_id, )
        end

end


