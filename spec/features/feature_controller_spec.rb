feature 'Page shows Bookmark Manager' do
  scenario 'shows Bookmark Manager' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'View bookmarks' do #first feature test to see all bookmarks, now go to app.rb (controller) to implement /bookmarks
  scenario 'show list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "https://www.google.com/"
    expect(page).to have_content "https://www.gmail.com/"
  end
end