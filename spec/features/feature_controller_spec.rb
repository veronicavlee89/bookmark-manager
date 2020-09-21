feature 'Page shows Bookmark Manager' do
  scenario 'shows Bookmark Manager' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'View bookmarks' do #first feature test to see all bookmarks, now go to app.rb (controller) to implement /bookmarks
  scenario 'show list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.askjeeves.com"
    expect(page).to have_content "http://www.twitter.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.makersacademy.com"
  end
end