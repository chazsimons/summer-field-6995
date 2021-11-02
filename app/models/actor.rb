class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def costars
    movies.joins(:actor_movies)
  end
end
