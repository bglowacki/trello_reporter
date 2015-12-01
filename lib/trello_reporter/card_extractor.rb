require 'trello_reporter/date_resolver'
require 'trello_reporter/models/card'

module TrelloReporter
  class CardExtractor
    POSSIBLE_LIST_NAMES = ["done", "zamknięte", "dane", "kolumna magdy"]

    def initialize
      @date_resolver = DateResolver.new
    end

    def my_cards(day)
      my_cards = get_my_cards
      my_cards.select do |card|
        card.last_activity_date.to_date == @date_resolver.resolve(day)
      end.map do |card|
        Card.new(card.name, card.desc, card.short_url)
      end
    end

    def get_my_cards
      lists = get_lists_from_board("DEVELOPMENT")
      lists.flat_map do |list|
        list.cards.select do |card|
          card.member_ids.include?("54eae7f4877e5e3d1471f8ab")
        end
      end
    end

    def get_lists_from_board(board_name)
      board = find_board(board_name)
      board.lists.select do |list|
        POSSIBLE_LIST_NAMES.any? {|list_name| list.name.downcase.include?(list_name)}
      end
    end

    def find_board(name)
      Trello::Board.all.each do |board|
        if board.name.downcase == name.downcase
          return board
        else
          return nil
        end
      end
    end
  end
end