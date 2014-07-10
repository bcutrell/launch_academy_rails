# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :estate do
    street_address "15 Spring Road"
    city "Marion"
    state "MA"
    postal_code "02738"
    description "Home sweet home"
    owner_id 1
  end
end
