def create_link_makers
  log_in
  visit '/links/new'
  fill_in 'url',   with: 'http://www.makersacademy.com/'
  fill_in 'title', with: 'Makers Academy'
  fill_in 'tags',  with: 'education'

  click_button 'Create link'
end

def create_link_facebook
  log_in
  visit '/links/new'
  fill_in 'url',   with: 'http://www.facebook.com/'
  fill_in 'title', with: 'Facebook'
  fill_in 'tags',  with: 'entertainment'

  click_button 'Create link'
end

def log_in
  visit('/users/new')
  fill_in "email_address", with: "12345@live.xyz"
  fill_in "password", with: "password"
  click_button "sign up"
end
