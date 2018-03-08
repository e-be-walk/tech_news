class Headline
  attr_accessor :title, :author, :publisher, :url, :summary, :timestamp

  def self.today
    self.scrape_news
  end

  def self.scrape_news
    news = []

    news << self.scrape_nytimes
    news << self.scrape_wired
    news << self.scrape_techcrunch

    news
  end


end
