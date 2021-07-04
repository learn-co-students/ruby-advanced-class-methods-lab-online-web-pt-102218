class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    self.new.save
  end

  def save
    self.class.all << self
    self
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    return new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    return new_song
  end

 def self.find_by_name(name)
  @@all.each do |song|
    if song.name == name
      return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |name_obj| name_obj.name }
  end

  def self.new_from_filename(filename)
    my_song = self.create
    my_song.artist_name = filename.split(" - ")[0]
    my_song.name = filename.split(" - ")[1].chomp(".mp3")
    return my_song
  end

  def self.create_from_filename(filename)
    my_song = self.new_from_filename(filename)
    return my_song
  end

  def self.destroy_all
    @@all.clear
  end

end
