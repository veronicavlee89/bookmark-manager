require 'bookmark'

feature 'Update bookmark' do
  scenario 'user updates an existing bookmark title' do
    Bookmark.add('Google','https://www.google.com/')

    visit '/'
    click_button 'Edit'
    expect(page).to have_current_path("/bookmarks/#{Bookmark.all[0].id}/edit")
    expect(page).to have_field('title', with: 'Google')
    expect(page).to have_field('url', with: 'https://www.google.com/')

    fill_in 'title', with: 'TEST'
    click_button 'Update'
    expect(page).to have_current_path('/bookmarks')
    expect(page).to have_link('TEST', href:'https://www.google.com/')
  end
end