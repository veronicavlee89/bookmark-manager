require 'bookmark'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (title,url) VALUES ('Makers', 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (title,url) VALUES('Destroy', 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (title,url) VALUES('Google', 'http://www.google.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end
end