def create_link_makers
  visit '/links/new'
  fill_in 'url',   with: 'http://www.makersacademy.com/'
  fill_in 'title', with: 'Makers Academy'
  fill_in 'tags',  with: 'education'

  click_button 'Create link'
end

def create_link_facebook
  visit '/links/new'
  fill_in 'url',   with: 'http://www.facebook.com/'
  fill_in 'title', with: 'Facebook'
  fill_in 'tags',  with: 'entertainment'

  click_button 'Create link'
end
