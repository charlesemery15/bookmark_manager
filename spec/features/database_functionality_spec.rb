feature 'View Homepage' do
  scenario 'should display a list of links' do
    Link.create(url: 'https://en.wikipedia.org/wiki/Albion', title: 'Wikipedia Albion')
    visit('/links')
    # this checks if the link works with a status code of 200 ok
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Albion')
    end
  end
end
