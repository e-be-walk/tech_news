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
    #news << self.scrape_wired
    #news << self.scrape_techcrunch

    news
  end

  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("https://www.nytimes.com/section/technology"))

    article = self.new
    article.title = doc.search("#latest-panel h2.headline").first.text
    article.author = doc.search("#latest-panel p.byline").first.text
    article.publisher = "The New York Times"
    article.url = doc.search("#latest-panel a.story-link").first.attr("href")

    article
  end

end
