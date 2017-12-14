feature 'View Homepage' do
  scenario 'should display a list of links' do
    Link.create(url: 'https://en.wikipedia.org/wiki/Albion', title: 'Wikipedia Albion')
    visit ('/links')
    # this checks if the link works with a status code of 200 ok
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Albion')
    end
  end

  scenario "search bar to look for tags" do
    create_link_facebook
    fill_in 'search', with: 'entertainment'
    expect(page).to have_content 'www.facebook.com'
  end
end
