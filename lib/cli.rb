class CLI

  def call
    Scrape.scrape_articles
    list_headlines
  end

  def list_headlines
    puts "Here are the newest headlines in tech:"
    Article.show_headlines

    puts <<-DOC.gsub /^\s*/, ''
    If you would like more information, input the number of the article or type
    'exit' to leave. If you would like to retrieve the newest headlines again,
    type 'menu'.
    DOC
    option
  end

  def option
    input = gets.strip

    if input == "menu"
      list_headlines
    elsif input == "exit"
      goodbye
    elsif input.to_i.between?(1, Article.all.count)
        article = Article.all[input.to_i-1]
          puts "\n\t#{article.title} - #{article.author} - #{article.publisher}"
          puts "\n\t#{article.timestamp}"
          puts "\n\t#{article.url}"
          puts "\n\t#{article.summary}"
          puts "\nIf you would like to read the article, input the article number again."
          article_content
          #puts "\nIf you would like to return to the headlines enter 'menu', otherwise exit."
        #option
      else
        puts "I don't understand your input. Type 1, 2, or 3, exit or menu to make a choice."
        list_headlines
      end
  end

  def article_content
    input = gets.strip

    if input.to_i.between?(1, Article.all.count)
        article = Article.all[input.to_i-1]
        puts "#{article.content}"
        goodbye
    elsif ["N", "NO"].include?(input.upcase)
      list_headlines
    else
      puts "I don't understand your input. Type Y or N exit or menu to make a choice."
      list_headlines
    end
  end

  def goodbye
    puts "Check back for more new news about fun tech stuff soon!"
  end

end
