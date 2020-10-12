require 'pry'

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        @@all << self
    end

    def self.all
        @@all
    end
    
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(name)
        #binding.pry
    end

    def self.new_by_filename(file_name)
        song_name = file_name.split(" - ")[1]
        artist = file_name.split(" - ")[0]
        song = self.new(song_name)
        song.artist = Artist.new(artist)
        song
        #binding.pry
    end

    
end