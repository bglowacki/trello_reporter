require 'colorize'

module TrelloReporter
  class SimpleFormatter
    def display(cards)
      cards.each do |card|
        puts "#{card.title.truncate(100).colorize(:green)} \n #{card.short_url.colorize(:blue)}"
      end
    end
  end
end