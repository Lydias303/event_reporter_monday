require 'messages'
require 'loader'
require 'helper'
require 'queue'
require 'finder'
# require 'pry'
class CLI
  attr_reader :instream, :outstream, :message, :input, :remaining_input, :helper, :loader
  attr_accessor :command, :entries

  def initialize(instream, outstream)
    @instream        = instream
    @outstream       = outstream
    @input           = ""
    @message         = Messages.new
    @helper          = Helper.new(instream, outstream)
    @command         = ""
    @remaining_input = []
    @loader          = Loader.new(instream, outstream)
    @entries         = loader.entries
    @finder          = Finder.new(@entries)
  end

  def call
    outstream.puts message.intro_message
    until exit?
      outstream.print message.next_command
      @input = instream.gets.strip
      determine_command
      process_initial_commands
    end
  end

  def process_initial_commands
    case
    when load?            then @loader.process_load(@remaining_input)
    when help?            then @helper.process_help(@remaining_input)
    when queue?           then process_queue
    when find?            then @finder.process_find(@remaining_input)
    when exit?            then outstream.puts message.exit
    else  outstream.puts message.invalid_message
    end
  end

  def determine_command
  @remaining_input = @input.downcase.split
  self.command = @remaining_input.delete_at(0)
  end

  def help?
    command == "help"
  end

  def queue?
    command == "queue"
  end

  def load?
    command == "load"
  end

  def find?
    command == "find"
  end

  def exit?
    command == "exit"
  end
end
