require 'spec_helper'

describe FoodItem do

  it {should have_valid(:title).when('Chicken')}
  it {should_not have_valid(:title).when('',nil)}
  
  it {should have_valid(:description).when('Chicken is good')}
  it {should_not have_valid(:description).when('',nil)}

  it {should have_valid(:quantity).when(1,100)}
  it {should_not have_valid(:quantity).when('',nil)}
end
