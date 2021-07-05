require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    create = self.new
    @@all << create
    create
  end
  
  def self.new_by_name(name)
    song_name = self.new
    song_name.name = name
    song_name
  end
  
  def self.create_by_name(name)
    creation = self.new
    creation.name = name
    @@all << creation
    creation
  end
  
  def self.find_by_name(name)
    @@all.find {|person| person.name == name ? true : false}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
  end
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end
  
  def self.new_from_filename(file)
    parts = file.split(" - ")
    song = parts[1].chomp(".mp3")
    artist_name = parts[0]
    new_song = self.new
    new_song.name = song
    new_song.artist_name = artist_name
    new_song.save
    new_song
  end
  
  def self.create_from_filename(file)
        parts = file.split(" - ")
    song = parts[1].chomp(".mp3")
    artist_name = parts[0]
    new_song = self.new
    new_song.name = song
    new_song.artist_name = artist_name
    new_song.save
    new_song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
end
