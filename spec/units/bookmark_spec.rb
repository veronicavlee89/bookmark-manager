require 'bookmark'

describe '.all' do
  it 'returns a list of bookmarks' do
    
    Bookmark.add('Makers', 'https://www.makersacademy.com')
    Bookmark.add('Destroy', 'https://www.destroyallsoftware.com')
    Bookmark.add('Google', 'https://www.google.com')

    expect(Bookmark.all[0].url).to eq ('https://www.makersacademy.com')
    expect(Bookmark.all[1].url).to eq ('https://www.destroyallsoftware.com')
    expect(Bookmark.all[2].url).to eq ('https://www.google.com')
  end

  describe'.delete' do
    it 'deletes the bookmark' do
    Bookmark.add('Makers', 'https://www.makersacademy.com')
    Bookmark.add('Destroy', 'https://www.destroyallsoftware.com')
    Bookmark.add('Google', 'https://www.google.com')
    id = Bookmark.all[0].id
    expect{Bookmark.delete(id)}.to change {Bookmark.all.count}.by (-1)
    expect(Bookmark.all[0].id).not_to eq id
    end


  end
end