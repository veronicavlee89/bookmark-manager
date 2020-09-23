require 'bookmark'
require './setup_test_database'

describe '.all' do
  it 'returns a list of bookmarks' do
    setup_test_database
    # Add the test data
    # connection.exec("INSERT INTO bookmarks (title,url) VALUES ('Makers', 'http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks (title,url) VALUES('Destroy', 'http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks (title,url) VALUES('Google', 'http://www.google.com');")
    # bookmarks = Bookmark.all
    Bookmark.add('Makers', 'http://www.makersacademy.com')
    Bookmark.add('Destroy', 'http://www.destroyallsoftware.com')
    Bookmark.add('Google', 'http://www.google.com')

    

    expect(Bookmark.all[0].url).to eq ('http://www.makersacademy.com')
    expect(Bookmark.all[1].url).to eq ('http://www.destroyallsoftware.com')
    expect(Bookmark.all[2].url).to eq ('http://www.google.com')
  end
end