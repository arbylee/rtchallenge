class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
    rt_ids = @challenge.movies.map {|movie| movie.rt_id }

    @movies = rt_ids.collect {|rt_id| RottenMovie.find(id: rt_id)}.flatten
  end
end
