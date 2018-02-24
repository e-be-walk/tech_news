class TechNews::CLI

  def call
    list_headlines
    option
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
    input = nil
    while input != "exit"
      puts <<-DOC.gsub /^\s*/, ''
      If you would like more information, input the number of the article or type
      'exit' to leave. If you would like to retrieve the newest headlines again,
      type 'retrieve'.
      DOC
      input = gets.strip
      if input.to_i > 0
        the_headline = @headlines[input.to_i-1]
        puts "#{the_headline.title} - #{the_headline.author} - #{the_headline.publisher}"
      elsif input == "retrieve"
        list_headlines
      else input != "exit"
        #when exit is enterred, it also says I don't understand input
        puts "I don't understand your input. Type 1, 2, or 3, exit or retrieve to make a choice."
      end
    end
  end

  def goodbye
    puts "Check back for more new news about fun tech stuff soon!"
  end

end
