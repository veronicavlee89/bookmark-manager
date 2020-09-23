require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (title,url) VALUES ('Makers', 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (title,url) VALUES('Destroy', 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (title,url) VALUES('Google', 'http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content "Makers, http://www.makersacademy.com"
    expect(page).to have_content "Destroy, http://www.destroyallsoftware.com"
    expect(page).to have_content "Google, http://www.google.com"
  end
end