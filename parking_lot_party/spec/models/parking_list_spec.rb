require 'spec_helper'

describe ParkingList do

it {should have_valid(:first_name).when('ben')}
it {should_not have_valid(:first_name).when(nil, '')}

it {should have_valid(:last_name).when('cutrell')}
it {should_not have_valid(:last_name).when(nil, '')}

it {should have_valid(:email).when('ben@t.com')}
it {should_not have_valid(:email).when(nil, '', 'foo')}

it {should have_valid(:spot_number).when(1, 3, 5)}
it {should_not have_valid(:spot_number).when(nil, '', 61)}


it 'informs the parker that they have no neighbors' do
  neighbor_test = FactoryGirl.build(:parking_list)
  expect(neighbor_test.neighbor).to eql('You do not have any neighbors')
  end

# it { should respond_to (:email)}

  # FactoryGirl.built(:parking_list_party, spot_number: 2)
  
end
