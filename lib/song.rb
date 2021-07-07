
require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
 def self.create 
   c = self.new 
   @@all << c 
   c 
 end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name 
    @@all << song 
    song
  end 
  
def self.create_by_name(name)
    song = Song.new 
    song.name = name 
    @@all << song 
    song 
end 
  
def self.find_by_name(name)
    @@all.find {|i| i.name == name}
end 
  
def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end 
end

def self.alphabetical
    @@all.sort_by(&:name)
    
end 


def self.new_from_filename(mp3)
    @file = []
    data = mp3.split(/[-,.]/)
    data.pop
    data.map do |i| 
      @file << i.strip
    end 
    songs = Song.new 
    artist_name = @file[0]
    name = @file[1]
    songs.artist_name = artist_name 
    songs.name = name 
    songs
    
  end
  
  def self.create_from_filename(mp3)
    @file = []
    data = mp3.split(/[-,.]/)
    data.pop
    data.map do |i|
      @file << i.strip 
    end 
    songs = Song.new
    @@all << songs
    artist_name = @file[0]
    name = @file[1]
    songs.artist_name = artist_name 
    songs.name = name 
    songs 
    
  end 
  
  def self.destroy_all
    @@all.clear
  end 

end 
