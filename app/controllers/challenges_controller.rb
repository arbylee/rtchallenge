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
end
