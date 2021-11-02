require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before :each do
    @twenith = Studio.create!({name: '20th Century Pictures', location: 'Hollywood'})
    @universal = Studio.create!({name: 'Universal Studios', location: 'Studio City'})
    @raiders = @twenith.movies.create!({title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure'})
    @starwars = @twenith.movies.create!({title: 'Star Wars 4', creation_year: 1977, genre: 'Sci-fi'})
    @actor_1 = Actor.create!({name: 'Harrison Ford', age: 78})
    @actor_2 = Actor.create!({name: 'Carrie Fisher', age: 60})
    @actor_3 = Actor.create!({name: 'Paul Freeman', age: 65})
    @actor_4 = Actor.create!({name: 'Alfred Molina', age: 68})
    @actor_5 = Actor.create!({name: 'Kenny Baker', age: 81})
    ActorMovie.create!({actor_id: @actor_1.id, movie_id: @raiders.id})
    ActorMovie.create!({actor_id: @actor_3.id, movie_id: @raiders.id})
    ActorMovie.create!({actor_id: @actor_4.id, movie_id: @raiders.id})
    ActorMovie.create!({actor_id: @actor_1.id, movie_id: @starwars.id})
    ActorMovie.create!({actor_id: @actor_2.id, movie_id: @starwars.id})
    ActorMovie.create!({actor_id: @actor_5.id, movie_id: @starwars.id})
  end

  it 'displays a movies information' do
    visit movie_path(@raiders.id)

    expect(page).to have_content(@raiders.title)
    expect(page).to have_content(@raiders.genre)
    expect(page).to have_content(@raiders.creation_year)
    expect(page).to_not have_content(@starwars.title)
  end

  it 'displays the cast from youngest to oldest' do
    visit movie_path(@raiders.id)

    expect(@actor_3.name).to appear_before(@actor_1.name)
    expect(@actor_4.name).to appear_before(@actor_1.name)
  end

  it 'displays the average age of the cast' do
    visit movie_path(@starwars.id)

    expect(@actor_2.name).to appear_before(@actor_1.name)
    expect(page).to have_content("Average age of cast: #{@starwars.avg_actor_age}")
  end
end
