class ChallengesMovie < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :movie
end
