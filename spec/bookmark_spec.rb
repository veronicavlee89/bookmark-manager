require 'bookmark'

describe Bookmark do

  describe '.all' do
    it "returns all available bookmarks" do
      bookmarks = Bookmark.all #class method
      expect(bookmarks).to include("https://www.google.com/")
      expect(bookmarks).to include("https://www.gmail.com/")
    end
  end
end