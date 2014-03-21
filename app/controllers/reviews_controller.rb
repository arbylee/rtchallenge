class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def create
    reviews = params['reviews']
    challenge_id = params['challenge_id']
    reviews.each do |index, rev|
      if rev['score'].present?
        movie = Movie.find(rev['movie_id'])
        review = Review.find_or_initialize_by(user_id: current_user.id,
                                              movie_id: movie.id,
                                              challenge_id: challenge_id)
        review.score = rev['score']
        review.save
      end
    end
    redirect_to challenges_path
  end
end
