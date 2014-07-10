require 'spec_helper'

feature 'Employee can view the inventory', %Q{
  As a food service employee
  I want to receive inventory
  So that it can be recorded that we have food items
} do

# Acceptance Criteria:

# * I must specify a title, description, and quantity of the food item
# * If I do not specify the required information, 
#   I am prompted to fix errors and to resubmit
# * If I specify the required information, my inventory entry is recorded.


scenario 'I successfully create a food record' do

  prev_count = FoodItem.count

  visit '/'
  click_link 'New Food Item'
  fill_in 'Title', with: "Chicken"
  fill_in 'Description', with: "Tastes perty good"
  fill_in 'Quantity', with: 100
  click_button 'Create Food item'

  
  expect(FoodItem.count).to eql(prev_count + 1)
  expect(page).to have_content('Food Item Recorded')
  end

  scenario 'I use invalid information' do
      visit '/'
  click_link 'New Food Item'
  fill_in 'Title', with: ""
  fill_in 'Description', with: nil
  fill_in 'Quantity', with: 'One Hundred'
  click_button 'Create Food item'

  expect(page).to have_content("can't be blank")
  expect(page).to have_content("not a number")
  end

  
end
