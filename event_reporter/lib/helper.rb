require_relative 'messages'
require 'pry'
require_relative 'cli'

class Helper

  attr_reader :file_name, :remaining_input, :messages, :outstream, :instream, :help

  def initialize(instream, outstream)
    @instream = instream
    @outstream = outstream
    @messages = Messages.new
  end

  def process_help(remaining_input)
    case
    when remaining_input == []                 then outstream.puts messages.help
    when remaining_input == ["find"]           then outstream.puts messages.help_find
    when remaining_input == ["search"]         then outstream.puts messages.help_search
    when remaining_input == ["queue"]          then outstream.puts messages.help_queue
    when remaining_input == ["queue","clear"]  then outstream.puts messages.help_queue_clear
    when remaining_input == ["queue","count"]  then outstream.puts messages.help_queue_count
    when remaining_input == ["queue","save"]   then outstream.puts messages.help_queue_save
    when remaining_input == ["queue","print"]  then outstream.puts messages.help_queue_print
    end
  end
end
