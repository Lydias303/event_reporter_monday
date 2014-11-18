require_relative 'test_helper'

class TestHelper
def test_user_get_help
  cli = CLI.new(nil,nil)
  cli.stub :command, 'help' do
    assert cli.help?
    refute cli.load?
  end



end
