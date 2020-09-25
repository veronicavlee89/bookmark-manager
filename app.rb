require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect("/bookmarks")
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :view_bookmarks
  end

  post '/bookmarks/new' do
    Bookmark.add(params[:title],params[:url])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.get(params[:id])
    erb :edit_bookmark
  end

  patch '/bookmarks/:id' do
    p params
    Bookmark.update(params[:id], params[:title], params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end