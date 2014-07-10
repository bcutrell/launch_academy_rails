require 'spec_helper'

feature "parker registers for a parking spot", %Q{
As a parker
I want to see a list of my parking activity
So that I can see where I've parked over time
} do 

# Acceptance Criteria: 
# * When checking in, if I've previously checked in with the same email, 
# I am given the option to see parking activity 
# * If I opt to see parking activity, I am shown all of my check-ins sorted in reverse chronological order. 
# I can see the spot number and the day and time I checked in. 
# * If I have not previously checked in, I do not have the option to see parking activity

scenario 'I see my parking activity if I have previously checked in' do 

    Timecop.freeze(Date.yesterday) do  
    visit '/'
    click_link "New parking registration"
    fill_in 'First name', with: 'bennyboi'
    fill_in 'Last name', with: 'boylston'
    fill_in 'Email', with: 'bennyboi@boylston.com'
    fill_in 'Spot number', with: 1
    click_button 'Register'
  end

    Timecop.freeze(Date.today) do  
    visit '/'
    click_link "New parking registration"
    fill_in 'First name', with: 'bennyboi'
    fill_in 'Last name', with: 'boylston'
    fill_in 'Email', with: 'bennyboi@boylston.com'
    fill_in 'Spot number', with: 1
    click_button 'Register'
  end


  Timecop.freeze(Date.tomorrow) do 
    visit '/'
    click_link "New parking registration"
    click_link 'View History'
    expect(page).to have_content("bennyboi")
end


end

end