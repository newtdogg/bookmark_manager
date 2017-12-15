feature 'Viewing links by tag' do
  scenario "should filter links by tags" do
    create_link_makers
    create_link_facebook
    visit('/tags/education')

    expect(page.status_code).to eq 200

    expect(page).not_to have_content('Facebook')
    expect(page).to have_content('Makers academy')
  end
end
