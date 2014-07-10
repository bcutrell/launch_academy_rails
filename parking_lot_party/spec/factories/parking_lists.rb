# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :parking_list do
    first_name "MyString"
    last_name "MyString"
    email "MyString@r.com"
    spot_number 1
    parked_on Date.today
  end
end
