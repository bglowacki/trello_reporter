require 'trello_reporter/formatters/simple_formatter'

module TrelloReporter
  class CardsFormatter
    def initialize
      @simple_formatter = SimpleFormatter.new
    end
    def simple_format(cards)
      @simple_formatter.display(cards)
    end
  end
end