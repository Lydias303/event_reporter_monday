require 'pry'

class Queue


  def initialize
    @attendees = []
  end

  def process_queue
    
  end

  def clear
    @attendees = []
  end

  def print_by_attribute(attribute)
    @attendees.sort_by do |attendee|
      attendee.send(attribute)
    end
  end

  def save

  end

  def count
    @attendees.count
  end

  def find


  end



end
