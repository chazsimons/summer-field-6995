require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:actor_movies)}
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe 'cast_sort' do
    it 'sorts a movies cast by age' do
      twenith = Studio.create!({name: '20th Century Pictures', location: 'Hollywood'})
      starwars = twenith.movies.create!({title: 'Star Wars 4', creation_year: 1977, genre: 'Sci-fi'})
      actor_1 = Actor.create!({name: 'Harrison Ford', age: 78})
      actor_2 = Actor.create!({name: 'Carrie Fisher', age: 60})
      actor_3 = Actor.create!({name: 'Paul Freeman', age: 65})
      actor_4 = Actor.create!({name: 'Alfred Molina', age: 68})
      actor_5 = Actor.create!({name: 'Kenny Baker', age: 81})
      ActorMovie.create!({actor_id: actor_1.id, movie_id: starwars.id})
      ActorMovie.create!({actor_id: actor_2.id, movie_id: starwars.id})
      ActorMovie.create!({actor_id: actor_5.id, movie_id: starwars.id})

      results = starwars.cast_sort
      expect(results).to eq([actor_2, actor_1, actor_5])
    end
  end

  describe 'avg_actor_age' do
    it 'calculates the average age of the cast' do
      twenith = Studio.create!({name: '20th Century Pictures', location: 'Hollywood'})
      starwars = twenith.movies.create!({title: 'Star Wars 4', creation_year: 1977, genre: 'Sci-fi'})
      actor_1 = Actor.create!({name: 'Harrison Ford', age: 78})
      actor_2 = Actor.create!({name: 'Carrie Fisher', age: 60})
      actor_3 = Actor.create!({name: 'Paul Freeman', age: 65})
      actor_4 = Actor.create!({name: 'Alfred Molina', age: 68})
      actor_5 = Actor.create!({name: 'Kenny Baker', age: 81})
      ActorMovie.create!({actor_id: actor_1.id, movie_id: starwars.id})
      ActorMovie.create!({actor_id: actor_2.id, movie_id: starwars.id})
      ActorMovie.create!({actor_id: actor_5.id, movie_id: starwars.id})

      result = starwars.avg_actor_age

      expect(result).to eq(73)
    end
  end
end
