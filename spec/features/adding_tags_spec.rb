feature 'Adding tags' do

  scenario 'The tags are visible on the bookmarks page' do
    visit '/links/new'
    create_link_makers
    expect(page).to have_content('education')
  end

  scenario 'I can add a single tag to a new link' do
    create_link_makers
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

  scenario 'I can add multiple tags to a single link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'education, gravy'

    click_button 'Create link'
    fill_in 'search', with: 'gravy'
    click_button "Submit"
    expect(page).to have_content 'www.makersacademy.com'
  end
end
