# bookmark-manager

# US 1
_As an user_

_So I can access websites quickly_

_I want to be able to see a list of bookmarks_
* first feature test 'View Bookmarks' on visit('/bookmarks')
* then implement get '/bookmarks' do (create hard-coded array of bookmark adresses), join to print


####1. User requests from Client - Client(Browser) sends GET request to Controller (app.rb) 

   (get '/' do erb: view_index)
   
####2. Controller (app.rb) asks the Class Bookmark to get all the bookmarks

* Controller (app.rb) grabs the view of the bookmarks from view_bookmark.erb 
 
* Controller gets data from Model(Class Bookmark) to put in view

   (get '/bookmarks' do @bookmarks = Bookmark.all) 
   
   ******Here, a class method self.all was added to be inside the scope of the class.
   We can directly access the object and there is no need to create another object/method to access it. 
   It does not pass to any instance of the class.
   
####3. Bookmark.erb sends html to app.rb 

   (iterate @bookmarks.each do |bookmark|) and shows it using beautiful html

####4. App.rb sends the view to the Client - to User



# US 2

_As an user_

_So I can add new bookmarks_

_I want to save a site title and address to the bookmark manager_

1. Set up Database in PostgreSQL (server that runs database)
2. Create a table called bookmark_manager and store urls
3. Create a SQL file in ./db/migrations
4. Install PG gem
5. Connect PG in the self.class - establish connection, check if all the tests pass
  
  Connect to `psql` and create the `bookmark_manager` and `bookmark_manager_test` databases:
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.
