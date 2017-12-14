feature 'filtering tags' do
  scenario 'Can search for a link with a tag' do
    visit('/links/new')
    fill_in 'url', with: 'https://medium.com/'
    fill_in 'title', with: 'Medium'
    fill_in 'tags', with: 'coding'
    click_button 'Create link'

    add_link
    visit('/tags/education')
    expect(page).to_not have_content 'coding'
    expect(page).to have_content 'https://en.wikipedia.org'
  end
end
