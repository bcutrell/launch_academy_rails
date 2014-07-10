require 'spec_helper'

describe Estate do

  it {should belong_to(:owner)}

  it { should have_valid(:street_address).when("15 Spring Road")}
  it { should_not have_valid(:street_address).when('',nil)}
  
  it { should have_valid(:city).when("Marion")}
  it { should_not have_valid(:city).when('',nil)}

  it {should have_valid(:state).when("MA")}
  it {should_not have_valid(:state).when('',nil, "mass")}

  it {should have_valid(:postal_code).when("02738")}
  it {should_not have_valid(:postal_code).when('',nil)}

  it {should have_valid(:description).when("Home sweet home")}
  
  it "identifies that there is no owner of the property" do 
    home =  FactoryGirl.create(:estate)
    expect(home.owner_name).to eql("No Owner")
  end

  it "identifies that there is no owner of the property" do
    owner = FactoryGirl.create(:owner) 
    house = FactoryGirl.create(:estate, owner_id: owner.id) 
    expect(house.owner_name).to eql(owner.last_name)
  end  
end
