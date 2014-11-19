require 'cleaner'

class Entry
  attr_reader :cleaner, :reg_date, :first_name, :last_name, :email, :phone, :street, :city, :state, :zipcode
  def initialize(data)
    @cleaner    = Cleaner.new
    @reg_date    = data[:regdate]
    @first_name = cleaner.clean_name(data[:first_name])
    @last_name  = cleaner.clean_name(data[:last_name])
    @email      = data[:email_address]
    @phone      = cleaner.clean_phone(data[:homephone])
    @street     = data[:street]
    @city       = cleaner.clean_city(data[:city])
    @state      = cleaner.clean_state(data[:state])
    @zipcode    = cleaner.clean_zipcode(data[:zipcode])

  end

  def find_by(attribute)
      entry.attribute
      binding.pry
  end


end
