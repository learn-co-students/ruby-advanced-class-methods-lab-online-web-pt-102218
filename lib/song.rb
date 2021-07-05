require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    s = self.new
    s.save
    s
  end

    def self.new_by_name(song_name)
      song = self.new
      song.name = song_name
      song

    end

    def self.create_by_name(song_by_name)
      song = self.new
      song.name = song_by_name
      song.save
      song
    end

    def self.find_by_name(song)
      @@all.find{|song_name| song_name.name == song}
    end

    def self.find_or_create_by_name(song_name)
      self.find_by_name(song_name) || self.create_by_name(song_name)

    end

    def self.alphabetical
      @@all.sort_by{|songs| songs.name}
    end

    def self.new_from_filename(song_file_name)
      song_parts = song_file_name.split(" - ")
      artist_name = song_parts[0]
      song_name = song_parts[1].gsub(".mp3", "")

      song = self.new
      song.name = song_name
      song.artist_name = artist_name


      song
    end

    def self.create_from_filename(song_file_name)
      song_parts = song_file_name.split(" - ")
      artist_name = song_parts[0]
      song_name = song_parts[1].gsub(".mp3", "")

      song = self.create
      song.name = song_name
      song.artist_name = artist_name


      song
    end

    def self.destroy_all
      @@all.clear
    end
end
