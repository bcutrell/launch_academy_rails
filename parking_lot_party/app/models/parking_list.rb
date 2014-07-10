class ParkingList < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_format_of :email, :with => /@/

  validates_numericality_of :spot_number,
   greater_than_or_equal_to: 1,
    less_than_or_equal_to: 60

    validate :already_occupied_spot

  def park
    self.parked_on = Date.today
    save
  end

  def history(parker)
    ParkingList.find_by first_name: parker.first_name
  end


  def neighbor
    friend_one = ParkingList.where(:spot_number => self.spot_number + 1).first
    friend_two = ParkingList.where(:spot_number => self.spot_number - 1).first
    if friend_one && friend_two
      "You have the following neighbors:
      #{friend_one.first_name} in #{friend_one.spot_number}
      #{friend_two.first_name} in #{friend_two.spot_number}"
    elsif friend_one
      "You have the following neighbor:
      #{friend_one.first_name} in #{friend_one.spot_number}"
    elsif friend_two
      "You have the following neighbor:
      #{friend_two.first_name} in #{friend_two.spot_number}"
    else
      "You do not have any neighbors"
    end
  end

protected
  def already_occupied_spot
    if self.spot_number.present? && self.parked_on.present?
      other_list_count = self.class.where({
        parked_on: self.parked_on,
        spot_number: self.spot_number
      }).count

      if other_list_count > 0
        self.errors.add(:spot_number, 'has already been taken')
      end
    end
  end  

end
