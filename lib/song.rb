require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song_name = self.new
    @@all << song_name
    song_name
  end
  
  def self.new_by_name(song_name)
    song_object = self.new
    song_object.name = song_name
    song_object
  end
  
  def self.create_by_name(song_name)
    song_object = self.new_by_name(song_name)
    @@all << song_object
    song_object
  end
  
  def self.find_by_name(song_name)
    @@all.find{ |song| song.name == song_name} 
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by{ |song| song.name}
  end

  def self.new_from_filename(filename)
      song_file = filename.split(" - ")
      artist_name = song_file[0]
      song_name = song_file[1].gsub(".mp3", "")
      
      song = self.create
      song.name = song_name
      song.artist_name = artist_name
      song
  end
  
  def self.create_from_filename(filename)
    song_file = self.new_from_filename(filename)
    song_file
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
