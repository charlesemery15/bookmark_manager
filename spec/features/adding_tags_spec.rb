feature 'Adding Tags' do
  scenario 'Can add a single tag to a new link' do
    visit('/links/new')
    fill_in 'url', with: 'https://en.wikipedia.org/wiki/Iliad'
    fill_in 'title', with: 'Wikipedia Iliad'
    fill_in 'tag', with: 'Wiki'

    click_button 'Create link'
    link = Link.first
    p link.tags
    expect(link.tags.map(&:name)).to include('Wiki')
  end
end
