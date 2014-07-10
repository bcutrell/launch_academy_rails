class Owner < ActiveRecord::Base

  has_many :estates,
  inverse_of: :owner,
  dependent: :nullify

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates_format_of :email,
  with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

  def estate_names
    address = []
    if self.estates.present?
      self.estates.each do |estate|
        address << estate.street_address
      end
      address.join(",")
    else
      "Not a badass"
    end
  end

  class << self
    def names
      self.pluck(:last_name)
    end
  end

end