require("minitest/autorun")
require("minitest/rg")
require_relative("../songs")

class SongsTest < MiniTest::Test
  def setup
    @song = Song.new("Tenacious D", "Tribute", "Rock")
    @song2 = Song.new("Oasis", "Don't Look Back In Anger", "Brit Pop")
    @song3 = Song.new("Ed Sheeran", "Sing", "Pop")
  end

  def test_artist_name
    assert_equal("Tenacious D", @song.artist)
    assert_equal("Oasis", @song2.artist)
    assert_equal("Ed Sheeran", @song3.artist)
  end

  def test_song_name
    assert_equal("Tribute", @song.track)
    assert_equal("Don't Look Back In Anger", @song2.track)
    assert_equal("Sing", @song3.track)
  end

  def test_song_genre
    assert_equal("Rock", @song.genre)
    assert_equal("Brit Pop", @song2.genre)
    assert_equal("Pop", @song3.genre)
  end

end
