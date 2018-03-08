class Article
  attr_accessor :title, :author, :publisher, :url, :summary, :timestamp
  @@all = []

  def initialize(article_array)
    @article = article_array.collect do |article_attribute|
      Article.new(self, article_attribute)
    end

    @@all << self
  end


  def self.all
    @@all
  end

  #def self.show_headlines
  #  all.each_with_index do |article, i|
  #    puts "#{i + 1}. #{article.title} - #{article.author} - #{article.publisher}"
  #  end
  #end

end
