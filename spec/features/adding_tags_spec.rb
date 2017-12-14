feature 'Adding Tags' do

  scenario 'Can add a single tag to a new link' do
    add_link
    link = Link.first
    # p link
    # sleep 1000
    expect(link.tags.map(&:name)).to include('education')
    # expect(page).to have_content "education"
  end

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    # our tags will be space separated
    fill_in 'tags',  with: 'education ruby'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end
end