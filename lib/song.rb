class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @@all << song
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).is_a?(Song)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.all
    @@all
  end

  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(file)
    song = self.new
    split = file.split(/[-.]/)
    split = split.collect { |str| str.strip }
    song.artist_name = split[0]
    song.name = split[1]
    song
  end

  def self.create_from_filename(file)
    song = self.new
    split = file.split(/[-.]/)
    split = split.collect { |str| str.strip }
    song.artist_name = split[0]
    song.name = split[1]
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
