class CLI

  def call
    puts "Here are the newest headlines in tech:"
    Scrape.scrape_articles
    Article.show_headlines
    #Headline.print_all
    list_headlines
    option
  end

  def list_headlines

    puts <<-DOC.gsub /^\s*/, ''
    If you would like more information, input the number of the article or type
    'exit' to leave. If you would like to retrieve the newest headlines again,
    type 'menu'.
    DOC
  end

  def option
      input = gets.strip

      if input.to_i.between?(1, Article.all.count)
        article = @articles[input.to_i-1]
        puts "\n\t#{article.title} - #{article.author} - #{article.publisher}"
        puts "\n\t#{article.timestamp}"
        puts "\n\t#{article.url}"
        puts "\n\t#{article.summary}"
        puts "\nIf you would like to return to the headlines enter 'menu', otherwise exit."
        option
      elsif input == "menu"
        call
      elsif input == "exit"
        goodbye
      else
        puts "I don't understand your input. Type 1, 2, or 3, exit or menu to make a choice."
      end
  end

  def goodbye
    puts "Check back for more new news about fun tech stuff soon!"
  end

end
