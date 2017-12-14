feature 'Adding Tags' do
  scenario 'Can add a single tag to a new link' do
    visit('/links/new')
    fill_in 'url', with: 'https://en.wikipedia.org/wiki/Iliad'
    fill_in 'title', with: 'Widipedia Iliad'
    fill_in 'tags', with: 'Wiki'

    click_button 'Create link'
    save_and_open_page
    link = Link.first
    # p link
    # sleep 1000
    # expect(link.tags.map(&:name)).to include('Wiki')
    expect(page).to have_content "Wiki"
  end
end
