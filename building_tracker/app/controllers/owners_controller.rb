class OwnersController < ApplicationController

def index
  @owners = Owner.all
end

def new
  @owner = Owner.new
end


def create
  @owner = Owner.new(reg_params)
  if @owner.save
    flash[:notice] = "Owner Recorded"
    redirect_to '/'
  else
    render :new
  end
end

def show
@estate = Estate.find(params[:id])
end

def edit
  @owner = Owner.find(params[:id])
end

def update
  @owner = Owner.find(params[:id])
  if @owner.update_attributes(params[:product])
    redirect_to '/', notice: 'Owner was updated'
  else
    render action: "edit"
  end
end

def destroy
  @owner = Owner.find(params[:id])
  @owner.destroy
  flash[:notice] = "Owner deleted"
  redirect_to '/'
end



protected
def reg_params
  params.require(:owner).permit(:first_name, :last_name, :email, :company)
end
end
