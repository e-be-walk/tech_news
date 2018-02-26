class TechNews::CLI

  def call
    list_headlines
    option
    #open_browser
    #goodbye
  end

  def list_headlines
    puts "Here are the newest headlines in tech:"
    @headlines = TechNews::Headline.today
    @headlines.each.with_index(1) do |headline, i|
      puts "#{i}. #{headline.title} - #{headline.author} - #{headline.publisher}"
    end
  end

  def option
      puts <<-DOC.gsub /^\s*/, ''
      \nIf you would like more information, input the number of the article or type
      'exit' to leave. If you would like to retrieve the newest headlines again,
      type 'retrieve'.
      DOC
      input = gets.strip
      
      if input.to_i > 0
        the_headline = @headlines[input.to_i-1]
        puts "\n\t#{the_headline.title} - #{the_headline.author} - #{the_headline.publisher}"
        puts "\n\t#{the_headline.timestamp}"
        puts "\n\t#{the_headline.url}"
        puts "\n #{the_headline.summary}"
        #system("open -a Chrome #{the_headline.url}")
        open_browser
      elsif input == "retrieve"
        call
      elsif input == "exit"
        goodbye
      else
        puts "I don't understand your input. Type 1, 2, or 3, exit or retrieve to make a choice."
      end
  end

  def open_browser
    puts "\n Would you like me to open this article in your browser? Y/N?"
    input = gets.strip
    #N and else works but something about the way I am calling the URL to open in system is not
    if input == "Y"
      system("open -a Chrome #{@headlines.url}")
    elsif input == "N"
      call
    else
      goodbye
    end
  end

  def goodbye
    puts "Check back for more new news about fun tech stuff soon!"
  end

end
