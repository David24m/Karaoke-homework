require("minitest/autorun")
require("minitest/rg")
require_relative("../rooms")
require_relative("../songs")
require_relative("../guests")
require_relative("guests_spec")

class RoomsTest < MiniTest::Test
  def setup
    @room = Room.new(1, 2, [], [], 10)
    @room2 = Room.new(2, 1, [], [], 20)
    @room3 = Room.new(3, 5, [], [], 30)
  end

  def test_room_number
    assert_equal(1, @room.number)
    assert_equal(2, @room2.number)
    assert_equal(3, @room3.number)
  end

  def test_capacity
    assert_equal(2, @room.capacity)
    assert_equal(1, @room2.capacity)
    assert_equal(5, @room3.capacity)
  end

  def test_add_guest_to_room
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    @room.add_to_guests(@guest)
    assert_equal(1, @room.number_of_guests)
  end

  def test_add_multiple_guests_to_room
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    @guest2 = Guest.new("Kurt Cobain", 30, "Don't Look Back In Anger")
    @room.add_to_guests(@guest)
    @room.add_to_guests(@guest2)
    assert_equal(2, @room.number_of_guests)
  end

  def test_remove_guest_from_room
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    @guest2 = Guest.new("Kurt Cobain", 30, "Don't Look Back In Anger")
    @room.add_to_guests(@guest)
    @room.add_to_guests(@guest2)
    @room.remove_from_guests()
    assert_equal(1, @room.number_of_guests)
  end

  def test_add_song_to_room
    @song = Song.new("Tenacious D", "Tribute", "Rock")
    @room.add_to_songs(@song)
    assert_equal(1, @room.number_of_songs)
  end

  def test_add_multiple_songs_to_room
    @song = Song.new("Tenacious D", "Tribute", "Rock")
    @song2 = Song.new("Oasis", "Don't Look Back In Anger", "Brit Pop")
    @room.add_to_songs(@song)
    @room.add_to_songs(@song2)
    assert_equal(2, @room.number_of_songs)
  end

  def test_add_multiple_songs_to_room
    @song = Song.new("Tenacious D", "Tribute", "Rock")
    @song2 = Song.new("Oasis", "Don't Look Back In Anger", "Brit Pop")
    @room.add_to_songs(@song)
    @room.add_to_songs(@song2)
    @room.remove_song_from_list()
    assert_equal(1, @room.number_of_songs)
  end

  def test_song_name
    @song = Song.new("Tenacious D", "Tribute", "Rock")
    @room.add_to_songs(@song)
    assert_equal(true, @room.has_song("Tribute"))
  end

  def test_song_name_not_in
    @song = Song.new("Tenacious D", "Tribute", "Rock")
    @room.add_to_songs(@song)
    assert_equal(false, @room.has_song("Sing"))
  end

  def test_if_room_has_enough_capacity__fine
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    @guest2 = Guest.new("Kurt Cobain", 30, "Don't Look Back In Anger")
    @room.add_to_guests(@guest)
    @room.add_to_guests(@guest2)
    assert_equal("There is enough room", @room.is_room_over_capacity)
  end

  def test_if_room_has_enough_capacity__overbooked
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    @guest2 = Guest.new("Kurt Cobain", 30, "Don't Look Back In Anger")
    @room2.add_to_guests(@guest)
    @room2.add_to_guests(@guest2)
    assert_equal("There are too many people to enter", @room2.is_room_over_capacity)
  end

  def test_guest_money
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    assert_equal(20, @guest.money)
  end

  def test_if_can_afford__can
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    @room.afford_it(@guest)
    assert_equal("This guest can afford to get in", @room.afford_it(@guest))
  end

  def test_if_can_afford__cannot
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    @room3.afford_it(@guest)
    assert_equal("Get out of here you bum!", @room3.afford_it(@guest))
  end

  def test_favourite_song
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    assert_equal("Tribute", @guest.favourite)
  end

  def test_favourite_song_is_on
    @guest = Guest.new("Che Guevara", 20, "Tribute")
    @song = Song.new("Tenacious D", "Tribute", "Rock")
    @room.add_to_guests(@guest)
    @room.add_to_songs(@song)
    assert_equal("Woooooo!", @room.match_up)
  end
  
  def test_favourite_song_is_missing
    @guest3 = Guest.new("Lionel Messi", 40, "Sing")
    @song3 = Song.new("Ed Sheeran", "Sing", "Pop")
    @room.add_to_guests(@guest3)
    @room.add_to_songs(@song3)
    assert_equal("Put on my favourite song!", @room.match_up)
  end

end
