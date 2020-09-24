require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect "/bookmarks"
    #erb (:view_index)
  end

  get '/bookmarks' do 
    #implemented after first feature test
    #@bookmarks = [
    #    "https://www.google.com/",
    #    "https://www.gmail.com/"
    #
    # bookmarks.join
    @bookmarks = Bookmark.all
    erb :view_bookmarks
  end

  post '/bookmarks/new' do
    Bookmark.add(params[:title],params[:url]) 
    redirect '/bookmarks'
  end

  post '/bookmarks/delete/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id' do
    @bookmark = Bookmark.get(params[:id])
    erb :view_bookmark
  end

  post 'bookmarks/update/:id' do
    Bookmark.update(params[:id], params[:title], params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end