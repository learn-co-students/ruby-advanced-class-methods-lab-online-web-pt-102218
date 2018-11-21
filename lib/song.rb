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
    c = self.new
    c.save
    c 
  end
  
  def self.new_by_name(name)
    song = self.new
    @name = name
    song.name = @name
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    @name = name 
    song.name = name 
    song.save
    song
  end
  
  def self.find_by_name(name)
    result = nil
    self.all.each do |s|
      result = s if s.name == name 
    end 
    result
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create_by_name(name) 
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
     
    f = filename.split(" - ")
    #@artist_name = f[0]
    #@name = f[1].gsub(".mp3", "")
    song.artist_name = f[0]
    song.name = f[1].gsub(".mp3", "")
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new
    f = filename.split(" - ")
    song.artist_name = f[0]
    song.name = f[1].gsub(".mp3", "")
    song.save
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end

