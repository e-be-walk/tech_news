class TechNews::CLI

  def call
    list_headlines
    option
    goodbye
  end

  def list_headlines
    puts "Here are the newest headlines in tech:"
    puts <<-DOC
    1. Wired
    2. TechCrunch
    3. NYTimes
    DOC
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
      case input
      when "1"
        puts "article content 1"
      when "2"
        puts "article content 2"
      when "3"
        puts "article content 3"
      when "retrieve"
        list_headlines
      else
        puts "I don't understand your input. Type 1, 2, or 3, exit or retrieve to make a choice."
      end
    end
  end

  def goodbye
    puts "Check back for more new news about fun tech stuff soon!"
  end

end
