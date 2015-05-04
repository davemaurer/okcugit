require 'minitest/autorun'
require 'minitest/pride'

class OkcugitTest < Minitest::test
  def test_it_can_find_a_repo
    assert_equal 'https://github.com/davemaurer/okcugit',
  end
end
