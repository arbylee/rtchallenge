class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
    @reviews = []
    @challenge.movies.each do |movie|
      @reviews << Review.find_or_initialize_by(user: current_user,
                                               challenge: @challenge,
                                               movie: movie)
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
end
