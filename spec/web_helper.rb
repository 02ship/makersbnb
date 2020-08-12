def add_user
  visit('/users/add')
    fill_in :name, with: 'Ryan'
    fill_in :email, with: 'ryan@makers.com'
    fill_in :password, with: '123456'
    click_button 'Sign up'
end
