# bookmark-manager

# US 1
_As a user_
_So I can access websites quickly_
_I want to be able to see a list of bookmarks_


1. User requests from Client - Client(Browser) sends GET request to Controller (app.rb)
2. Controller (app.rb) asks the Class Bookmark to get all the bookmarks
3. Controller (app.rb) grabs the view of the bookmarks from Bookmark.erb
4. Bookmark.erb sends html to app.rb
5. App.rb sends the view to the Client - to User
