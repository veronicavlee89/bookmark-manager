feature 'Page shows Hello World' do
  scenario 'shows hello world' do
    visit('/')
    expect(page).to have_content 'Hello, world!'
  end
end

feature 'View bookmarks' do
  scenario 'show list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'List of bookmarks'
  end
end