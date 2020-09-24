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

  describe '.delete' do
    it 'deletes the bookmark' do
    Bookmark.add('Makers', 'https://www.makersacademy.com')
    Bookmark.add('Destroy', 'https://www.destroyallsoftware.com')
    Bookmark.add('Google', 'https://www.google.com')
    id = Bookmark.all[0].id
    expect{Bookmark.delete(id)}.to change {Bookmark.all.count}.by (-1)
    expect(Bookmark.all[0].id).not_to eq id
    end
  end

  describe '.get(id)' do
    it 'returns the bookmark with the given id' do
      Bookmark.add('Makers', 'https://www.makersacademy.com')
      Bookmark.add('Destroy', 'https://www.destroyallsoftware.com')
      Bookmark.add('Google', 'https://www.google.com')

      id = Bookmark.all[2].id

      expect(Bookmark.get(id).id).to eq(id)
      expect(Bookmark.get(id).title).to eq('Google')
      expect(Bookmark.get(id).url).to eq('https://www.google.com')
    end
  end

  describe '.update(id, title, url)' do
    it 'updates the bookmark with given values' do
      Bookmark.add('Google', 'https://www.google.com')

      id = Bookmark.all[0].id

      Bookmark.update(id, 'Test', 'http://test.com')

      expect(Bookmark.get(id).id).to eq(id)
      expect(Bookmark.get(id).title).to eq('Test')
      expect(Bookmark.get(id).url).to eq('http://test.com')
    end
  end
end