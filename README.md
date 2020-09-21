# bookmark-manager

# US 1
_As an user_

_So I can access websites quickly_

_I want to be able to see a list of bookmarks_
* first feature test 'View Bookmarks' on visit('/bookmarks')
* then implement get '/bookmarks' do (create hard-coded array of bookmark adresses), join to print


#####1. User requests from Client - Client(Browser) sends GET request to Controller (app.rb) 

   (get '/' do erb: view_index)
#####2. Controller (app.rb) asks the Class Bookmark to get all the bookmarks

* Controller (app.rb) grabs the view of the bookmarks from view_bookmark.erb 
 
* controller gets data from Model(Class Bookmark) to put in view

   (get '/bookmarks' do @bookmarks = Bookmark.all) 
   
   ******Here, a class method self.all was added to be inside the scope of the class.
   We can directly access the object and there is no need to create another object/method to access it. 
   It does not pass to any instance of the class.
   
#####4. Bookmark.erb sends html to app.rb 

   (iterate @bookmarks.each do |bookmark|) and shows it using beautiful html

#####5. App.rb sends the view to the Client - to User



# US 2

_As an user_

_So I can add new bookmarks_

_I want to save a site title and address to the bookmark manager_

 1. Set up Database in PostgreSQL (server that runs database)
