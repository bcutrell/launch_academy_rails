require 'spec_helper'

feature "parker registers for a parking spot", %Q{
As a parker
I want to register my spot with my name
So that the parking company can identify my car
} do 

# Acceptance Criteria:

# I must specify a first name, last name, email, and parking spot number
# I must enter a valid parking spot number (the lot has spots identified as numbers 1-60)
# I must enter a valid email

scenario 'I register for a parking spot' do 
  visit '/'
  click_link "New parking registration"
  fill_in 'First name', with: 'bennyboi'
  fill_in 'Last name', with: 'boylston'
  fill_in 'Email', with: 'bennyboi@boylston.com'
  fill_in 'Spot number', with: 1
  click_button 'Register'
  expect(page).to have_content('You registered successfully')
end

scenario 'I fail to register for a parking spot' do 
visit '/'
click_link "New parking registration"
click_button 'Register'
expect(page).to have_content("can't be blank")
end

end


feature 'only one parker can register a given number', %Q{
As a parker
I cannot check in to a spot that has already been checked in
So that two cars are not parked in the same spot
} do
 

# Acceptance Criteria:

# * If I specify a parking spot that has already been checked in for the day, 
# * I am told I can't check in there.
# * If I specify a spot that hasn't yet been parked in today, I am able to check in.

scenario 'I try to register for a parking spot that has already been checked in' do 
  # FactoryGirl.create(:parking_lot_party)
  visit '/'
  click_link "New parking registration"
  fill_in 'First name', with: 'bennyboi'
  fill_in 'Last name', with: 'boylston'
  fill_in 'Email', with: 'bennyboi@boylston.com'
  fill_in 'Spot number', with: 1 
  click_button 'Register'

  visit '/'
  click_link "New parking registration"
  fill_in 'First name', with: 'bennyboi'
  fill_in 'Last name', with: 'boylston'
  fill_in 'Email', with: 'bennyboi@boylston.com'
  fill_in 'Spot number', with: 1
  click_button 'Register'
  expect(page).to have_content('Spot number has already been taken')
end

end