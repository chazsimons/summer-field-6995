require 'rails_helper'

RSpec.describe 'Studio Index Page' do
  before :each do
    @wb = Studio.create!({name: 'Warner Bros', location: 'Burbank'})
    @twenith = Studio.create!({name: '20th Century Pictures', location: 'Hollywood'})
    @universal = Studio.create!({name: 'Universal Studios', location: 'Studio City'})
    @batman = @wb.movies.create!({title: 'Batman', creation_year: 1989, genre: 'Superhero'})
    @raiders = @twenith.movies.create!({title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure'})
    @starwars = @twenith.movies.create!({title: 'Star Wars 4', creation_year: 1977, genre: 'Sci-fi'})
    @jurassic = @universal.movies.create!({title: 'Jurassic Park', creation_year: 1994, genre: 'Sci-fi/thriller'})
  end

  it 'displays a list of studios and their movies' do
    visit studios_path

    expect(page).to have_content(@wb.name)
    expect(page).to have_content(@twenith.location)
    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@batman.title)
  end
end
