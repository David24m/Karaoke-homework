require("minitest/autorun")
require("minitest/rg")
require_relative("../guests")

class GuestsTest < MiniTest::Test
  def setup
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    @guest2 = Guest.new("Kurt Cobain", 30, "Don't Look Back In Anger")
    @guest3 = Guest.new("Lionel Messi", 40, "Sing")
  end

  def test_guest_name
    assert_equal("Che Guevara", @guest.name)
    assert_equal("Kurt Cobain", @guest2.name)
    assert_equal("Lionel Messi", @guest3.name)
  end

  def test_guest_money
    assert_equal(20, @guest.money)
    assert_equal(30, @guest2.money)
    assert_equal(40, @guest3.money)
  end

  def test_guest_favourite
    assert_equal("Tribute", @guest.favourite)
    assert_equal("Don't Look Back In Anger", @guest2.favourite)
    assert_equal("Sing", @guest3.favourite)
  end

end
