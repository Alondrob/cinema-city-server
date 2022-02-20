class ReviewsController < ApplicationController


    def create
        movie_review = current_user.reviews.find_by(movie_id: movie_review_params[:movie_id])
        
        if movie_review
            movie_review.update(movie_review_params)
        else
            moview_review = current_user.reviews.create(movie_review_params)
        end
        head :ok

    end

    # ## user {
    #     reviews: [{}, {}]
    # }

    def index
        render json: current_user.reviews
    end

    def show
        movie_review = current_user.reviews.find_by(movie_id: params[:id])
        render json: {stars: movie_review ? movie_review.stars : 0}
    end

    ## 



    private

    def movie_review_params
        params.require(:movie_review).permit(:movie_id, :stars)
    end
end

## when you get data from the front end has to be nested inside a movieReview

# {moview_review: {
# movie_id: 2880
# }}
