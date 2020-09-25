require 'sinatra/base'
require './lib/bookmark'
require '../bookmark_veronica/database_connection_setup'

class BookmarkManager < Sinatra::Base

  set :method_override, true

  get '/' do
    redirect("/bookmarks")
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :view_bookmarks
  end

  post '/bookmarks/new' do
    Bookmark.add(params[:title],params[:url])
    redirect '/'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.get(params[:id])
    erb :edit_bookmark
  end

  patch '/bookmarks/:id' do
    p params
    Bookmark.update(params[:id], params[:title], params[:url])
    redirect '/'
  end

  run! if app_file == $0
end