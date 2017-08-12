class Song

  attr_accessor(:artist, :track, :genre)

  def initialize(artist, track, genre)
    @artist = artist
    @track = track
    @genre = genre
  end

end
