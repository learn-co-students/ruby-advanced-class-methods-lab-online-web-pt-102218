require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      if song.name == song_name
      return song
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
    self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    new = file_name.split(%r{\s?[-.]\s?})
    song = self.create_by_name(new[1])
    song.artist_name = new[0]
    song
  end

  def self.create_from_filename(file_name)
    new = file_name.split(%r{\s?[-.]\s?})
    if new[2] == "mp3"
      song = self.create_by_name(new[1])
      song.artist_name = new[0]
      song
    end
  end


  def self.destroy_all
    self.all.clear
  end


end
