class Song
  attr_accessor :name, :artist_name
  @@all = []
  

  def self.create
    newsong = self.new
    newsong.save
    newsong
  end

  def self.new_by_name(name)
    newsong = self.new
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    newsong = self.new_by_name(name)
    newsong.save
    newsong
  end

  def self.find_by_name(name)
    @@all.find{|x|
    x.name==name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort {|a,b|
    a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    filename = filename.split(".")[0]
    newsong = self.create_by_name(filename.split(" - ")[1])
    newsong.artist_name = filename.split(" - ")[0]
    newsong
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all =[]
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
