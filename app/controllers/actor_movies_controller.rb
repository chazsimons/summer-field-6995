class ActorMoviesController < ApplicationController

  def create
    actor = Actor.where(name: params[:add_actor])
    ActorMovie.create!({actor_id: actor.first.id, movie_id: params[:movie_id]})
    redirect_to movie_path(params[:movie_id])
  end
end
