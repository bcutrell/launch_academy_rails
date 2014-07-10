class Estate < ActiveRecord::Base

  STATES = %w{
    AL 
    AK 
    AR 
    AZ 
    CA 
    CO 
    CT 
    DC 
    DE 
    FL 
    GA 
    HA 
    IA 
    ID 
    IL 
    IN 
    KS 
    KY 
    LA 
    MA 
    MD 
    ME 
    MI 
    MN 
    MO 
    MS 
    MT 
    NC 
    ND 
    NE 
    NH 
    NJ 
    NM 
    NV 
    NY 
    OH 
    OK 
    OR 
    PA 
    PR 
    RI 
    SC 
    SD 
    TN 
    TX 
    UT 
    VA 
    VT 
    WA 
    WI 
    WV 
    WY 
    USA
  }

  belongs_to :owner,
  inverse_of: :estates


  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :postal_code

  validates_format_of :postal_code,
  with: /(^\d{5}$)|(^\d{5}-\d{4}$)/

  validates_inclusion_of :state, in: STATES

  def owner_name
    if self.owner.present?
      self.owner.last_name
    else
      "No Owner"
    end
  end

  class << self

  def states
    STATES
  end
end

end
