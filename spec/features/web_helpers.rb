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
  fill_in "password_confirmation", with: "password"
  click_button "sign up"
end

def log_in_bad
  visit('/users/new')
  fill_in "email_address", with: "12345@live.xyz"
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: "password1"
  click_button "sign up"
end

def log_in_without_email
  visit('/users/new')
  fill_in "email_address", with: ""
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: "password"
  click_button "sign up"
end

def log_in_with_bad_email
  visit('/users/new')
  fill_in "email_address", with: "sdhuhasdfhdsa"
  fill_in "password", with: "password"
  fill_in "password_confirmation", with: "password"
  click_button "sign up"
end
