feature 'adding bookmarks' do
    scenario 'user adds a bookmark via form' do
        visit ('/')
        fill_in :title, with: "Google Website"
        fill_in :url, with: "https://www.google.com/"
        click_button 'Add Bookmark'
        expect(page).to have_content "https://www.google.com/"
    end
end