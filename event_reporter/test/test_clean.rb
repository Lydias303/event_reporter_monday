require_relative 'test_helper'
require_relative '../lib/helper'
require_relative '../lib/clean_up'

class CleanTest < Minitest::Test

  def test_it_can_clean_first_name
    clean_up = CleanUp.new
    entry1 = ["11/12/08 10:47","Allison","Nguyen","arannon@jumpstartlab.com","6154385000","3155 19th St NW","Washington","DC","20010"]
    entry2 = ["11/12/08 15:00","Aya","Fuller","jtex@jumpstartlab.com","778.232.7000","2-1325 Barclay Street","Vancouver","BC","90210"]
    entries = [entry1, entry2]
    clean_up.clean_first_name(entries)
    assert_equal "allison", entry1[1]
    assert_equal "aya", entry2[1]
  end
end
