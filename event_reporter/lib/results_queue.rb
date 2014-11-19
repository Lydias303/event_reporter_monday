require 'pry'

class ResultsQueue
attr_reader :messages
  def initialize
    @messages = Messages.new

  end

  def process_queue(remaining_input)
    if remaining_input.size = 1
      short_command
    else
      long_command
    end
  end

  def short_command
    if remaining_input == ["count"]
      find
    elsif remaining_input == ["clear"]
      clear
    elsif remaining_input == ["print"]
      printer
    else
      outstream.puts messages.invalid_input
    end
  end

  def count
    @results.size
  end

  def clear
    @results = []
  end

  def printer
    
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
