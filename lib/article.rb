class Article
  attr_accessor :title, :author, :publisher, :url, :summary, :timestamp
  @@all = []

  def initialize(headline, attributes)

    @attributes.each do |article_attribute, attribute_value|
      self.send("#{article_attribute}", attribute_value)
    end

    @headline = headline

    @@all << self
  end


  def self.all
    @@all
  end

  def self.show_headlines
    all.each_with_index do |article, i|
      puts "#{i + 1}. #{article.title} - #{article.author} - #{article.publisher}"
    end
  end

end
