class EstatesController < ApplicationController

def index
  @estates = Estate.all
  @owners = Owner.all
end

def new
  @estate = Estate.new
  @owners = Owner.all
end


def create
  @estate = Estate.new(reg_params)
  
  if @estate.save
    flash[:notice] = "Estate Recorded"
    redirect_to '/'
  else
    render :new
  end
end

def show
@estate = Estate.find(params[:id])
end

def edit
  @estate = Estate.find(params[:id])
  @owners = Owner.all
end

def update
  @estate = Estate.find(params[:id])
  if @estate.update_attributes(reg_params)
    redirect_to '/', notice: 'Estate was updated'
  else
    render action: "edit"
  end
end

def destroy
  @estate = Estate.find(params[:id])
  @estate.destroy
  flash[:notice] = "Estate deleted"
  redirect_to estates_url 
end

protected
def reg_params
  params.require(:estate).permit(:street_address, :city, :state, :postal_code, :description, :owner_id)
end


end
