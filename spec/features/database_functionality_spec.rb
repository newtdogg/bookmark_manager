feature 'View Homepage' do
  scenario 'should display a list of links' do
    expect(page).to have_content(http://)
  end
end
