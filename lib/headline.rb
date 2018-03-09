class Headline
  attr_accessor :publisher, :articles
  @@all = []

  def initialize(publisher, article_array)
    @publisher = publisher

    @articles = article_array.collect do |article_attributes|
      Article.new(self, article_attributes)
    end

    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_all
    all.each_with_index do |article, i|
      puts "#{i + 1}. #{article.title} - #{article.author} - #{article.publisher}"
    end
  end

end
