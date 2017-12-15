def add_link
  visit('/links/new')
  fill_in 'url', with: 'https://en.wikipedia.org/'
  fill_in 'title', with: 'Wikipedia'
  fill_in 'tags', with: 'education'
  click_button 'Create link'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alice@example.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'

end
