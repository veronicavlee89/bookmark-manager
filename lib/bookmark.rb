require 'pg'


class Bookmark

  attr_reader :url, :title, :id

  def initialize (id, url, title)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = connect_to_db

    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.add(title,url)
    connection = connect_to_db
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}','#{url}');")
  end

  def self.delete(id)
    connection = connect_to_db
    connection.exec("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  def self.get(id)
    connection = connect_to_db
    bookmark = connection.exec("SELECT * FROM bookmarks WHERE id = '#{id}'")[0]
    Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title'])
  end

  def self.update(id, title, url)
    connection = connect_to_db
    connection.exec("UPDATE bookmarks SET title='#{title}', url='#{url}' WHERE id='#{id}';")
  end

  private

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end

end