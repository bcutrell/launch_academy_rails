class ParkingListsController < ApplicationController

  def new
    @parking_list = ParkingList.new
    @current_parker = current_parker
    @current_email = current_email
    @current_spot = current_spot

    if current_parker.try(:parked_on) == Date.yesterday
      flash[:notice] = "You parked here yesterday in #{current_parker.spot_number}"
      # @spot_from_yesterday = current_parker.spot_number
    end
  end

  def index
   @parking_list = ParkingList.where(parked_on: Date.today)
 end

 def history
  @history = ParkingList.where(email: current_email)
  if @history.nil?
    render :new
  end
end

def create
  @parking_list = ParkingList.new(reg_params)

  if @parking_list.park
    session[:parking_id] = @parking_list.id
    flash[:notice] = 'You registered successfully'
    redirect_to @parking_list 
  else
      # flash[:notice] = "can't be blank"
      render :new 
    end
  end

  def show
    @parking_list = ParkingList.find(params[:id])
  end

  protected
  def reg_params
    params.require(:parking_list).permit(
      :first_name,
      :last_name,
      :email,
      :spot_number)
  end

  def current_parker
    @current_parker = ParkingList.find_by_id(session[:parking_id])
  end

  def current_email
    current_parker.try(:email)
  end


  def current_spot
    current_parker.try(:spot_number)
  end

end
