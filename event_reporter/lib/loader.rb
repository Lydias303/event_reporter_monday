require 'pry'
require 'entry'
require 'csv'

class Loader
 attr_accessor :entries
 attr_reader :file_name, :instream, :outstream, :messages

def initialize(instream, outstream)
 @file_name = ""
 @entries = []
 @messages = Messages.new
 @instream = instream
 @outstream = outstream
end

 def load_file
   csv = CSV.open("./data/event_attendees.csv", headers: true, header_converters: :symbol)
   csv.each do |row|
     @entries << Entry.new(row)
   end
 end

 def process_load(remaining_input)
   if remaining_input == []
     @file_name = "event_attendees.csv"
   else
     @file_name = remaining_input[0]
   end
   load_file
   outstream.puts messages.load_message(@file_name)
 end
end
