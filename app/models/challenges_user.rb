class ChallengesUser < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user
end
