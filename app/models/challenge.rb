class Challenge < ActiveRecord::Base
  has_many :challenges_users
  has_many :users, through: :challenges_users
  has_many :challenges_movies
  has_many :movies, through: :challenges_movies
  has_many :reviews
end
