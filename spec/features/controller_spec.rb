feature 'Page shows Hello World' do
  scenario 'shows hello world' do
    visit('/')
    expect(page).to have_content 'Hello, world!'
  end
end