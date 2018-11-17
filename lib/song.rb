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
    song = Song.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end 
  
  def self.create_by_name(name)
    song = self.create 
    song.name = name
    song
  end 
  
  def self.find_by_name(name)
    @@all.find {|i| 
      if i.name == name
        name
      end
    }
  end 
  
  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else 
      self.create_by_name(song)
    end
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end
  
  def self.new_from_filename(file_name)
    song = self.create_by_name(file_name)
    out = file_name.split(" - ").each do |i|
      if i.match(/.mp3/)
        index = i.index('.')
        i.slice!(index, 4)
      end
    end
    song = self.new_by_name(out[1])
    song.artist_name = out[0]
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.create_by_name(file_name)
    out = file_name.split(" - ").each do |i|
      if i.match(/.mp3/)
        index = i.index('.')
        i.slice!(index, 4)
      end
    end
    song = self.create_by_name(out[1])
    song.artist_name = out[0]
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
