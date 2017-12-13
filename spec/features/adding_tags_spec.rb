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

end
