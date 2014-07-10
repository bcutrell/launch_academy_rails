require 'spec_helper'

feature 'parker registers a parking spot', %Q{
  As a parker
  I want to see my two neighbors
  So that I can get to know them better
} do
 

# Acceptance Criteria:

# * After checking in, if I have a neighbor in a slot 1 below me, or one above me, 
# I am informed of their name and what slot number they are currently in
# * If I do not have anyone parking next to me, I am told that I have no current neighbors

scenario 'I will be informed of my neighboring cars after I register for a parking spot' do 
    
    visit '/'
    click_link "New parking registration"
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'boylston'
    fill_in 'Email', with: 'bennyboi@boylston.com'
    fill_in 'Spot number', with: 1
    click_button 'Register'
    expect(page).to have_content('You do not have any neighbors')

    visit '/'
    click_link "New parking registration"
    fill_in 'First name', with: 'Brittany'
    fill_in 'Last name', with: 'boylston'
    fill_in 'Email', with: 'bennyboi@boylston.com'
    fill_in 'Spot number', with: 3
    click_button 'Register'
    expect(page).to have_content('You do not have any neighbors')

    visit '/'
    click_link "New parking registration"
    fill_in 'First name', with: 'bennyboi'
    fill_in 'Last name', with: 'boylston'
    fill_in 'Email', with: 'bennyboi@boylston.com'
    fill_in 'Spot number', with: 2
    click_button 'Register'
    expect(page).to have_content('You have the following neighbors: Brittany in 3 John in 1')


    visit '/'
    click_link "New parking registration"
    fill_in 'First name', with: 'Ktina'
    fill_in 'Last name', with: 'Durr'
    fill_in 'Email', with: 'Durr@Durr.com'
    fill_in 'Spot number', with: 4
    click_button 'Register'
    expect(page).to have_content('You have the following neighbor: Brittany in 3')

  end
end