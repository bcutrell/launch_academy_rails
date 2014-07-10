require 'spec_helper'

feature "system remembers the parkers email", %Q{
As a parker
I want the system to remember my email
So that I don't have to re-enter it
} do 

# Acceptance Criteria:

# If I have previously checked in via the same web browser, my email is remembered so that I don't have to re-enter it
# If I have not previously checked in, the email address field is left blank

scenario 'After I check in the system remembers me' do 
  visit '/'
  click_link "New parking registration"
  fill_in 'First name', with: 'bennyboi'
  fill_in 'Last name', with: 'boylston'
  fill_in 'Email', with: 'bennyboi@boylston.com'
  fill_in 'Spot number', with: 1
  click_button 'Register'

  visit '/'
  click_link "New parking registration"
  expect(page).to have_field('Email', with: "bennyboi@boylston.com" )

end

scenario 'If I have not previously checked in the system does not remember me' do
  visit '/'
   click_link "New parking registration"
  expect(page).to have_field('Email', with: nil )
end

end


feature "system remembers my parking spot", %Q{
As a parker
I want to know what spot I parked in yesterday
So that I can determine if I'm parking in the same spot
} do 

# Acceptance Criteria: 
# * If I parked yesterday, the system tells me where I parked yesterday when checking in. 
# * If I did not park yesterday, the system tells me 
# that I did not park yesterday when checking in.


scenario 'System fills in my spot from yesterday' do
  
 


  Timecop.freeze(Date.yesterday) do  
    visit '/'
    click_link "New parking registration"
    fill_in 'First name', with: 'bennyboi'
    fill_in 'Last name', with: 'boylston'
    fill_in 'Email', with: 'bennyboi@boylston.com'
    fill_in 'Spot number', with: 1
    click_button 'Register'
  end

  # Timecop.travel(Date.today) 
   visit '/'
  click_link "New parking registration"


  expect(page).to have_field("Spot number", with: "1" )

  # page.should have_xpath("//input[@value = 1]")
  expect(page).to have_selector('input[value="1"]' )

end
end


# feature "System suggests the last spot I parked in", %Q{

# As a parker
# I want the system to suggest the last spot I parked in 
# So that I don't have to re-enter the spot number
# } do 

# Acceptance Criteria:
# If I parked before today, the system prefills my spot number with the spot I last parked in.
# If I have not parked, the system does not prefill the spot number.


# end
