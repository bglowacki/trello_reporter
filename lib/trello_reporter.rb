$:.unshift File.join(File.dirname(__FILE__), "../lib")

require "trello_reporter/client"
require "trello_reporter/card_extractor"
require "trello_reporter/cards_formatter"

module TrelloReporter
  class Runner
    def initialize(argv, env)
      client = Client.new
      client.configure
      @card_extractor = CardExtractor.new
      @cards_formatter = CardsFormatter.new
    end
    def run
      cards = @card_extractor.my_cards("last workday")
      @cards_formatter.simple_format(cards)
    end
  end
end