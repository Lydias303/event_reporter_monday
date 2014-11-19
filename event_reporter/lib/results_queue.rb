require 'terminal-table'
require 'pry'
require 'finder'

class ResultsQueue
attr_reader :message, :remaining_input, :instream, :outstream
attr_accessor :results
  def initialize(instream, outstream)
    @message = Messages.new
    @results = []
  end

  def process_queue(remaining_input, results)
    @results = results
    if remaining_input.size == 1
      short_command(remaining_input)
    else
      long_command
    end
  end

  def short_command(remaining_input)
    if remaining_input == ["count"]
      count
    elsif remaining_input == ["clear"]
      clear
    elsif remaining_input == ["print"]
      printer
    else
      outstream.puts message.invalid_message
    end
  end

  def count
    puts "#{@results.count}"
  end

  def clear
    @results = []
    puts "queue cleared!"
  end

  def printer
    if @results.empty?
      outstream.puts message.empty_queue
    else
    rows = []
    @results.each do |entry|
      rows << [
        "#{entry.last_name.capitalize}",
        "#{entry.first_name.capitalize}",
        "#{entry.email}",
        "#{entry.zipcode}",
        "#{entry.city.capitalize}",
        "#{entry.state}",
        "#{entry.street}",
        "#{entry.phone}"
        ]
      end
    table = Terminal::Table.new :title => "Queue Results", :headings => ['LAST NAME', 'FIRST NAME', 'EMAIL', 'ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE'], :rows => rows
    puts table
    end
  end

  def print_by_attribute(attribute)
    @attendees.sort_by do |attendee|
      attendee.send(attribute)
    end
  end

  def save

  end


  def find


  end
end
