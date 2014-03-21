class Movie < ActiveRecord::Base
  def title
    rt_movie.title
  end

  def rt_movie
    @rt_movie ||= RottenMovie.find(id: self.rt_id)
  end

  def clips
    if !@clips
      clips_url = URI.parse(rt_movie.links.clips + "?apikey=#{Rotten.api_key}")
      resp = Net::HTTP.get_response(clips_url)
      @clips = JSON(resp.body)['clips']
    end
    return @clips
  end

  def trailer_link
    if clips.present?
      clips.first['links']['alternate']
    end
  end
end
