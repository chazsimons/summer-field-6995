class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def cast_sort
    actors.order(:age)
  end

  def avg_actor_age
    actors.average(:age)
  end
end
