class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
    @reviews = []
    @challenge.movies.each do |movie|
      @reviews << Review.find_or_initialize_by(user_id: current_user.id,
                                               challenge_id: @challenge.id,
                                               movie_id: movie.id)
    end
  end

  def new
    @challenge = Challenge.new
    @users = User.all
    @movies = Movie.all
  end

  def create
    @challenge = Challenge.new
    @challenge.movie_ids = params['challenge']['movie_ids']
    @challenge.user_ids = params['challenge']['user_ids']
    @challenge.save
    redirect_to challenges_path
  end

  def results
    @challenge = Challenge.find(params[:id])
    @reviews = {}
    reviews_by_user = Review.where(challenge_id: @challenge.id).group_by(&:user_id)
    @users = @challenge.users.all
    @movies = @challenge.movies
    @movies.each do |movie|
      @reviews[movie.id] = {}
      @users.each do |user|
        movie_review = reviews_by_user[user.id].detect{|rev| rev.movie_id == movie.id}
        @reviews[movie.id][user.id] = movie_review.score if movie_review
      end
    end
  end
end
