class TechNews::CLI

  def call
    list_headlines
    option
    #open_browser
    goodbye
  end

  def list_headlines
    puts "Here are the newest headlines in tech:"
    @headlines = TechNews::Headline.today
    @headlines.each.with_index(1) do |headline, i|
      puts "#{i}. #{headline.title} - #{headline.author} - #{headline.publisher}"
    end
  end

  def option
    input = ""
    while input != "exit"
      puts <<-DOC.gsub /^\s*/, ''
      \nIf you would like more information, input the number of the article or type
      'exit' to leave. If you would like to retrieve the newest headlines again,
      type 'retrieve'.
      DOC
      input = gets.strip
      #case statement that lists 1,2, or 3 and recalls info- asking user if they want
      #to open article. new method to open url in browser if y. n, return list
      #still need to correct when exit.
      if input.to_i > 0
        the_headline = @headlines[input.to_i-1]
        puts "\n\t#{the_headline.title} - #{the_headline.author} - #{the_headline.publisher}"
        puts "\n\t#{the_headline.timestamp}"
        puts "\n\t#{the_headline.url}"
        puts "\n #{the_headline.summary}"
        puts "\n Would you like me to open the url in your browser? Y/N?"
          input = gets.strip
          case input
          when "Y"
            system("open #{the_headline.url}")
          end
        #open_browser
      elsif input == "retrieve"
        list_headlines
      else input != "exit"
        #when exit is enterred, it also says I don't understand input
        puts "I don't understand your input. Type 1, 2, or 3, exit or retrieve to make a choice."
      end
    end
  end

  #def open_browser
  #  input = gets.strip
#
#    if input == "Y"
#      system("open #{@headline.url}")
#    else
#      call
#    end
#  end

  def goodbye
    puts "Check back for more new news about fun tech stuff soon!"
  end

end
