require 'spec_helper'

feature 'Real Estate Associate can record building owners', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

# Acceptance Criteria:

# * I must specify a first name, last name, and email address
# * I can optionally specify a company name
# * If I do not specify the required information, 
# I am presented with errors
# * If I specify the required information, 
# the owner is recorded and I am redirected to enter another new owner


  scenario 'I assign an owner to a building' do

    prev_count = Owner.count
    visit root_path 

    click_link 'New Owner'
    fill_in 'First name', with: "Chillvester"
    fill_in 'Last name', with: "Stallone"
    fill_in 'Email', with: "straightchilling@gmail.com"
    fill_in 'Company', with: "Goldman Sachs"
    click_button 'Add Owner'

    expect(Owner.count).to eql(prev_count + 1)
    expect(page).to have_content('Owner Recorded')
    expect(page).to have_content('New Owner')
  end
end

feature 'Real Estate Associate matchs an owner of a building', %Q{

  As a real estate associate
  I want to match an owner of a building
  So that I can refer back to pertinent information
  
} do

# Acceptance Criteria:
# * When recording a building, I want to optionally associate 
# the building with its rightful owner.
# * If I delete an owner, the owner and its primary key 
# should no longer be associated with any properties.

  scenario 'I assign an owner to a building' do

    owner = FactoryGirl.create(:owner)
    prev_count = Estate.count

    visit root_path 

    click_link 'New Estate'
    fill_in 'Street address', with: "15 Spring Road"
    fill_in 'City', with: "Marion"
    fill_in 'State', with: "MA"
    fill_in 'Postal code', with: "02738"
    fill_in 'Description', with: "Home sweet home"
    select("#{owner.last_name}", :from => 'Owner')
    click_button 'Record Estate'

    expect(Estate.count).to eql(prev_count + 1)
    expect(page).to have_content('Estate Recorded')
    expect(page).to have_content('New Estate')
  end

  scenario 'I delete an owner' do

    owner = FactoryGirl.create(:owner)
    house = FactoryGirl.create(:estate, owner_id: owner.id)
    owner.destroy

    visit root_path

    expect(page).to_not have_content(owner.first_name)
    expect(page).to have_content("No Owner")
  end
end
