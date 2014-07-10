class FoodItemsController < ApplicationController

def index
  @food_items = FoodItem.all
end

def new
  @food_item = FoodItem.new
end


def create
  @food_item = FoodItem.new(reg_params)
  if @food_item.save
    flash[:notice] = "Food Item Recorded"
    redirect_to '/'
  else
    render :new
  end
end

def show
@food_item = FoodItem.find(params[:id])
end

def edit
  @food_item = FoodItem.find(params[:id])
end

def update
  @food_item = FoodItem.find(params[:id])
  if @food_item.update_attributes(params[:product])
    redirect_to @food_item, notice: 'Food Item was updated'
  else
    render action: "edit"
  end
end

def destroy
  @food_item = FoodItem.find(params[:id])
  @food_item.destroy
  flash[:notice] = "Big Mistake"
  redirect_to food_items_url 
end

protected
def reg_params
  params.require(:food_item).permit(:title, :description, :quantity)
end



end
