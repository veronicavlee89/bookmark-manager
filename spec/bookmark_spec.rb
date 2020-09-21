require 'bookmark'

describe Bookmark do
  subject(:bookmark) { Bookmark.new }
  let(:list_bookmarks) do [
      "https://www.google.com/",
      "https://www.gmail.com/",
  ]
  end

  describe '#all' do
    it "prints a list of bookmarks" do
    expect(subject.all).to eq :list_bookmarks
    end
  end
end