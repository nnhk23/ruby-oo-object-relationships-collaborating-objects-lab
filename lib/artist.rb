require 'pry'

class Artist

    attr_accessor :name, :list

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @list = []
    end

    def self.all
        @@all
    end

    def songs
        Song.all.collect{|song| 
            if song.artist == self
                @list << song
            end
        }
        @list
    end

    def add_song(song)
        @list << song
        #binding.pry
    end    
    
    def self.look(name)
        self.all.find{|artist| artist.name == name}
    end

    def self.create(name)
        artist = Artist.new(name)
        artist
    end

    def self.find_or_create_by_name(name)
        if self.look(name)
            self.look(name)
        else
            self.create(name)
        end
    end

    def print_songs
        @list.each {|song|
            puts song.name
        }
    end

    
end