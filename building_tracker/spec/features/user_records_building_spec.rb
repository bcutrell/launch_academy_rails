require 'spec_helper'

feature 'Real Estate Associate records a building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

# Acceptance Criteria:

  # * I must specify a street address, city, state, and postal code
  # * Only US states can be specified
  # * I can optionally specify a description of the building
  # * If I enter all of the required information 
  # in the required format, the building is recorded.
  # * If I do not specify all of the required information in the required formats,
  # the building is not recorded and I am presented with errors
  # * Upon successfully creating a building, I am redirected 
  # so that I can record another building.


  scenario 'I record a building' do

    prev_count = Estate.count
    visit root_path 

    click_link 'New Estate'
    fill_in 'Street address', with: "15 Spring Road"
    fill_in 'City', with: "Marion"
    fill_in 'State', with: "MA"
    fill_in 'Postal code', with: "02738"
    fill_in 'Description', with: "Home sweet home"
    click_button 'Record Estate'

    expect(Estate.count).to eql(prev_count + 1)
    expect(page).to have_content('Estate Recorded')
    expect(page).to have_content('New Estate')

  end


  scenario 'I use an invalid state acronym' do

    prev_count = Estate.count
    visit root_path 

    click_link 'New Estate'
    fill_in 'Street address', with: "15 Spring Road"
    fill_in 'City', with: "Marion"
    fill_in 'State', with: "Massachusetts"
    fill_in 'Postal code', with: "02738"
    fill_in 'Description', with: "Home sweet home"
    click_button 'Record Estate'

    expect(Estate.count).to eql(prev_count)
    expect(page).to have_content('not included in the list')
  end

  scenario 'I use invalid information' do
  
    prev_count = Estate.count
    visit root_path 
    click_link 'New Estate'
    click_button 'Record Estate'
    
    expect(page).to have_content("can't be blank")
    expect(Estate.count).to eql(prev_count)
  end
end