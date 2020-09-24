require 'bookmark'

feature 'deleting bookmarks' do
    scenario 'user adds a bookmark via form' do
        Bookmark.add('Google','https://www.google.com/')
        visit ('/')
        click_button 'Delete'
        expect(page).not_to have_link("Google", href:"https://www.google.com/")
        expect(page).to have_current_path('/bookmarks')
    end
end