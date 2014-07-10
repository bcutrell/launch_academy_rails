require 'spec_helper'

describe Owner do
  
  it {should have_many(:estates)}

  it { should have_valid(:first_name).when("Chillvester")}
  it { should_not have_valid(:first_name).when('',nil)}
  
  it { should have_valid(:last_name).when("Buffet")}
  it { should_not have_valid(:last_name).when('',nil)}

  it {should have_valid(:email).when("chillingbuffet@berkhath.org")}
  it {should_not have_valid(:email).when('',nil, "mass")}

  it {should have_valid(:company).when("berky hath")}

  it "identifies that the owner does not own any estates" do 
    owner = FactoryGirl.create(:owner)
    expect(owner.estate_names).to eql("Not a badass")
  end

  it "prints out the addresses for each estate the owner owns" do
    owner = FactoryGirl.create(:owner) 
    house = FactoryGirl.create(:estate, owner_id: owner.id) 
    expect(owner.estate_names).to eql(house.street_address)
  end
end
