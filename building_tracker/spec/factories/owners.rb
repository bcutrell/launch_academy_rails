# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "Chillvester"
    last_name "Stallone"
    email "chillys@gmail.com"
    company "Pats Corp."
  end
end
