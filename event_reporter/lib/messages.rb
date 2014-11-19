class Messages

  def help
    "Please choose from the following options:
    help find
    help load
    help queue
    help queue count
    help queue clear
    help queue save
    help queue print"
  end

  def intro_message
    "Welcome to Entry Repository."
  end

  def next_command
    "Enter your command.\n> "
  end

  def load_message(file_name)
    "File '#{file_name}' has been loaded."
  end

  def exit
    "exit"
  end

  def invalid_message
    "Invalid entry, please try again. "
  end

  def help_queue_clear
    "QUEUE CLEAR"
  end

  def help_queue_count
    "COUNT"
  end

  def help_queue_save
    "SAVE TO"
  end

  def help_queue_print
    "PRINT"
  end

  def help_queue
    "QUEUE"
  end

  def help_find
    "FIND!"
  end

  def help_search
    "SEARCH"
  end
end
