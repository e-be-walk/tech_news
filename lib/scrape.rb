class Scrape
  #attr_accessor :title, :author, :publisher, :url, :summary, :timestamp

  #def self.today
  #  self.scrape_news
  #end
  #def initialize
  #  @article = article
  #end

  #def self.scrape_articles
  #  article = []

  #  article << self.scrape_nytimes
  #  article << self.scrape_wired
  #  article << self.scrape_techcrunch

  #  article
  #end

  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("https://www.nytimes.com/section/technology"))
      article_array = {
        :title => doc.search("#latest-panel h2.headline").first.text.strip,
        :author => doc.search("#latest-panel p.byline").first.text.strip,
        :publisher => "The New York Times",
        :url => doc.search("#latest-panel a.story-link").first.attr("href"),
        :summary => doc.search("#latest-panel p.summary").first.text.strip,
        :timestamp => doc.search("div.stream footer.story-footer").first.text.strip
      }
    article_array
  end

  def self.scrape_wired
    doc = Nokogiri::HTML(open("https://www.wired.com/"))

    article_array = {
      :title => doc.search("div.secondary-grid-component h5.post-listing-list-item__title").first.text,
      :author => doc.search("div.secondary-grid-component span.byline-component__content").first.text,
      :publisher => "Wired",
      :url => doc.search("div.secondary-grid-component a.post-listing-list-item__link").first.attr("href"),
      :summary => "Unfortunately, Wired does not include a summary either.",
      :timestamp => "Sorry- Wired does not include a timestamp. I assure you, this is the most recent article on their page.\n"
    }

    article_array
  end

  def self.scrape_techcrunch
    doc = Nokogiri::HTML(open("https://techcrunch.com/"))

    article_array = {
      :title => doc.search("div.block-content h2.post-title").first.text,
      :author => doc.search("div.block-content div.byline a").first.attr("title"),
      :publisher => "TechCrunch",
      :url => doc.search("div.block-content h2.post-title a").first.attr("href"),
      :summary => doc.search("div.block-content p.excerpt").first.text,
      :timestamp => doc.search("div.byline time.timestamp").first.text.strip
    }

    article_array
  end


end
