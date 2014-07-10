class FoodItem < ActiveRecord::Base
  validates_presence_of :title, :description
  validates_numericality_of :quantity
end
