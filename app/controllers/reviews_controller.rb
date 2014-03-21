class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def create
    reviews = params['reviews']
    reviews.each do |index, rev|
      if rev['score'].present?
        movie = Movie.find_or_create_by_rt_id(rev['movie_id'])
        review = Review.find_or_initialize_by(user: current_user, movie: movie)
        review.score = rev['score']
        review.save
      end
    end
    redirect_to challenges_path
  end
end
