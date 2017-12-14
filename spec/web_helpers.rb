def add_link
  visit('/links/new')
  fill_in 'url', with: 'https://en.wikipedia.org/'
  fill_in 'title', with: 'Wikipedia'
  fill_in 'tags', with: 'education'
  click_button 'Create link'
end
