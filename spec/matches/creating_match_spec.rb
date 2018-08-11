require 'rails_helper.rb'
 
feature 'Add Employee', type: :feature do 
  background do
    user = User.create(email: "oaaos@hotmail.com", password: "111")
    visit login_path
    fill_in 'email', with: 'oaaos@hotmail.com'
    fill_in 'password', with: '111'
    click_button 'Submit'

    expect(page).to have_content('Welcome')
  end 
  scenario 'can create a match' do
    # 1. go to root where will be button to Add New Book:
    visit '/'
    # 2. click on Add New Book button
    click_link 'Create new match'
    # 3. Fill form - add title
    choose('match_category_football')
    fill_in 'match[position]',  with: 'Any'
    fill_in 'match[date]',  with: '11/08/2018'
    fill_in 'match[start_time]',  with: '09:00'
    fill_in 'match[field]',  with: 'court1'
    fill_in 'match[num_of_player]',  with: 3 
    # 4. Click on submit form button
    click_button 'Save Match'
    # 5. Then we should be redirected to show page with book details (book title)
    expect(page).to have_content('football')
  end
end