feature 'Creating links' do
  scenario "should add the site's address and title to my bookmark manager" do
    visit('/links/new')
    fill_in 'url', with: 'https://en.wikipedia.org/wiki/Iliad'
    fill_in 'title', with: 'Wikipedia Iliad'
    click_button 'Create link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Iliad')
    end
  end
end
