class Company < ApplicationRecord
  has_rich_text :description
  
  validates_format_of :email, with:  /\A[a-zA-Z0-9+_.-]+@getmainstreet.com*\z/
  validate :check_valid_zip_code?
  before_save :update_city_state

  def check_valid_zip_code?
    if ZipCodes.identify("#{self.zip_code}").nil?
      errors.add('Invalid', 'Zip Code')
    end
  end

  def update_city_state
    region = ZipCodes.identify("#{self.zip_code}")
    city =  region[:city]
    state = region[:state_name]
  end

end


