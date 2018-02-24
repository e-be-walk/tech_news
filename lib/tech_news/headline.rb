class TechNews::Headline
  attr_accessor :title, :author, :publisher, :url

  def self.today
    #puts <<-DOC
    #1. Wired
    #2. TechCrunch
    #3. NYTimes
    #DOC
    self.scrape_news
  end

  def self.scrape_news
    news = []

    news << self.scrape_nytimes
    news << self.scrape_wired
    news << self.scrape_techcrunch

    news
  end
  #fix sloppy formatting issues
  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("https://www.nytimes.com/section/technology"))

    article = self.new
    article.title = doc.search("#latest-panel h2.headline").first.text
    article.author = doc.search("#latest-panel p.byline").first.text
    article.publisher = "The New York Times"
    article.url = doc.search("#latest-panel a.story-link").first.attr("href")

    article
  end

  def self.scrape_wired
    doc = Nokogiri::HTML(open("https://www.wired.com/"))
    #binding.pry

    article = self.new
    article.title = doc.search("ul.post-listing-component__list h5.post-listing-list-item__title").first.text
    article.author = doc.search("ul.post-listing-component__list span.byline-component__content").first.text
    article.publisher = "Wired"
    article.url = doc.search("ul.post-listing-component__list a.post-listing-list-item__link").first.attr("href")

    article    
  end

  def self.scrape_techcrunch
    doc = Nokogiri::HTML(open("https://techcrunch.com/"))
    #binding.pry

    article = self.new
    article.title = doc.search("div.block-content h2.post-title").first.text
    #author will need work so that it does not also retrieve timestamp...?
    article.author = doc.search("div.block-content div.byline a").first.attr("title")
    article.publisher = "TechCrunch"
    article.url = doc.search("div.block-content h2.post-title a").first.attr("href")
    article
    
  end


end
