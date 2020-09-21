require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do #implemented after first feature test
    #@bookmarks = [
    #    "https://www.google.com/",
    #    "https://www.gmail.com/"
    #]
                      # bookmarks.join
    @bookmarks = Bookmark.all
    erb :view_bookmark
  end


  run! if app_file == $0
end