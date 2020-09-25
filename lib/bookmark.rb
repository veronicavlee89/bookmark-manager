require 'pg'
require 'database_connection'


class Bookmark

  attr_reader :url, :title, :id

  def initialize (id, url, title)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.add(title,url)
    DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES ('#{title}','#{url}');")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  def self.get(id)
    bookmark = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = '#{id}'")[0]
    Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title'])
  end

  def self.update(id, title, url)
    DatabaseConnection.query("UPDATE bookmarks SET title='#{title}', url='#{url}' WHERE id='#{id}';")
  end
end