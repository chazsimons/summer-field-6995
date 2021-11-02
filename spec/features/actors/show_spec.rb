require 'rails_helper'

RSpec.describe 'Actor Show Page' do
  before :each do
    @twenith = Studio.create!({name: '20th Century Pictures', location: 'Hollywood'})
    @universal = Studio.create!({name: 'Universal Studios', location: 'Studio City'})
    @raiders = @twenith.movies.create!({title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure'})
    @starwars = @twenith.movies.create!({title: 'Star Wars 4', creation_year: 1977, genre: 'Sci-fi'})
    @jurassic = @universal.movies.create!({title: 'Jurassic Park', creation_year: 1994, genre: 'Sci-fi/thriller'})
    @actor_1 = Actor.create!({name: 'Harrison Ford', age: 78})
    @actor_2 = Actor.create!({name: 'Carrie Fisher', age: 60})
    @actor_3 = Actor.create!({name: 'Paul Freeman', age: 65})
    @actor_4 = Actor.create!({name: 'Alfred Molina', age: 68})
    @actor_5 = Actor.create!({name: 'Kenny Baker', age: 81})
    @actor_6 = Actor.create!({name: 'Logan Lerman', age: 35})
    ActorMovie.create!({actor_id: @actor_6.id, movie_id: @jurassic.id})
    ActorMovie.create!({actor_id: @actor_1.id, movie_id: @raiders.id})
    ActorMovie.create!({actor_id: @actor_3.id, movie_id: @raiders.id})
    ActorMovie.create!({actor_id: @actor_4.id, movie_id: @raiders.id})
    ActorMovie.create!({actor_id: @actor_1.id, movie_id: @starwars.id})
    ActorMovie.create!({actor_id: @actor_2.id, movie_id: @starwars.id})
    ActorMovie.create!({actor_id: @actor_5.id, movie_id: @starwars.id})
  end

  it 'displays the name and age of the actor' do
    visit actor_path(@actor_1.id)

    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_1.age)
    expect(page).to_not have_content(@actor_6.name)
  end

  xit 'displays a list of actors they have previously worked with' do
    visit actor_path(@actor_1.id)

    expect(page).to have_content(@actor_2.name)
    expect(page).to have_content(@actor_3.name)
    expect(page).to have_content(@actor_4.name)
    expect(page).to have_content(@actor_5.name)
  end
end
