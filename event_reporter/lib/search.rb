
class Search
  attr_reader :user_input, :data           # => nil

def initialize(user_input)
  @user_input = user_input
  @data = []
end

def lookup_by_reg_date (data, user_input)
  @queue = data.find_all do |attendee|
    attendee.regdate == user_input
  end
end

end
