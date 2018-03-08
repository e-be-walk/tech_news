class Scrape

  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("https://www.nytimes.com/section/technology"))
    article = Article.new

    article.title = doc.search("#latest-panel h2.headline").first.text.strip
    article.author = doc.search("#latest-panel p.byline").first.text.strip
    article.publisher = "The New York Times"
    article.url = doc.search("#latest-panel a.story-link").first.attr("href")
    article.summary = doc.search("#latest-panel p.summary").first.text.strip
    article.timestamp = doc.search("div.stream footer.story-footer").first.text.strip

    article.save
  end

  def self.scrape_wired
    doc = Nokogiri::HTML(open("https://www.wired.com/"))
    article = Article.new

    article.title = doc.search("div.secondary-grid-component h5.post-listing-list-item__title").first.text
    article.author = doc.search("div.secondary-grid-component span.byline-component__content").first.text
    article.publisher = "Wired"
    article.url = doc.search("div.secondary-grid-component a.post-listing-list-item__link").first.attr("href")
    article.summary = "Unfortunately, Wired does not include a summary either."
    article.timestamp = "Sorry- Wired does not include a timestamp. I assure you, this is the most recent article on their page.\n"

    article.save
  end

  def self.scrape_techcrunch
    doc = Nokogiri::HTML(open("https://techcrunch.com/"))
    article = Article.new

    article.title = doc.search("div.block-content h2.post-title").first.text
    article.author = doc.search("div.block-content div.byline a").first.attr("title")
    article.publisher = "TechCrunch"
    article.url = doc.search("div.block-content h2.post-title a").first.attr("href")
    article.summary = doc.search("div.block-content p.excerpt").first.text
    article.timestamp = doc.search("div.byline time.timestamp").first.text.strip

    article.save
  end


end
