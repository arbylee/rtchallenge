class Movie < ActiveRecord::Base
  def title
    rt_movie.title
  end

  def rt_movie
    @rt_movie ||= RottenMovie.find(id: self.rt_id)
  end
end
