class Article
  attr_accessor :title, :author, :publisher, :url, :summary, :timestamp
  @@all = []

  def initialize(attributes)

    attributes.each{|article_attribute, attribute_value| self.send("#{article_attribute}=", attribute_value)}


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

  #def self.show_details
  #  all.each_with_index do |article|
  #    puts "\n\t#{article.title} - #{article.author} - #{article.publisher}"
  #    puts "\n\t#{article.timestamp}"
  #    puts "\n\t#{article.url}"
  #    puts "\n\t#{article.summary}"
  #  end
  #end

end
