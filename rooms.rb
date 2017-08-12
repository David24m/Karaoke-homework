require_relative("guests")
require_relative("songs")

class Room

  attr_accessor(:number, :capacity, :guests, :songs, :fee)

  def initialize(number, capacity, guests, songs, fee)
    @number = number
    @capacity = capacity
    @guests = guests
    @songs = songs
    @fee = fee
  end

  def add_to_guests(guest)
    @guests.push(guest)
  end

  def number_of_guests()
    @guests.length
  end

  def remove_from_guests()
    @guests.pop()
  end

  def add_to_songs(song)
    @songs.push(song)
  end

  def number_of_songs()
    @songs.length
  end

  def remove_song_from_list()
    @songs.pop()
  end

  def has_song(track)
    return @songs.any? { |song| song.track == track }
  end

  def is_room_over_capacity
    if number_of_guests <= @capacity
      return "There is enough room"
    else
      return "There are too many people to enter"
    end
  end

  def afford_it(guest)
    if guest.money >= @fee
      return "This guest can afford to get in"
    else
      return "Get out of here you bum!"
    end
  end

  # def match_up
  #
  #   return @songs.length
  #   #   return "Woooooo!"
  #   # else
  #   #   return "Put on my favourite song!"
  #   # end
  # end


end
