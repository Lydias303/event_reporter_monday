require 'loader'
require 'pry'
require 'entry'
require 'cli'

class Finder
  attr_reader :user_input, :entries, :results

  def initialize(entries)
    @entries = entries
    @results = []
  end

  def process_find(remaining_input)
    remaining_input.shift
    attribute = remaining_input.delete_at(0)
    criteria = remaining_input.join(" ")
    @results = find(attribute, criteria)
    puts results
    puts results.count
  end

  def find(attribute, criteria)
    @entries.select do |entry|
      entry.send(attribute) == criteria
    end
  end
end
