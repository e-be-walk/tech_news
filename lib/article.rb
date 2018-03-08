class Article
  attr_accessor :title, :author, :publisher, :url, :summary, :timestamp
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

end
