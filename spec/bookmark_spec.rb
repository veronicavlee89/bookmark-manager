require 'bookmark'
require './setup_test_database'

describe '.all' do
  it 'returns a list of bookmarks' do
    
    Bookmark.add('Makers', 'https://www.makersacademy.com')
    Bookmark.add('Destroy', 'https://www.destroyallsoftware.com')
    Bookmark.add('Google', 'https://www.google.com')

    expect(Bookmark.all[0].url).to eq ('https://www.makersacademy.com')
    expect(Bookmark.all[1].url).to eq ('https://www.destroyallsoftware.com')
    expect(Bookmark.all[2].url).to eq ('https://www.google.com')
  end
end