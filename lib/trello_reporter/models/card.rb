module TrelloReporter
  class Card
    attr_reader :title, :description, :short_url
    def initialize(title, description, short_url)
      @title = title
      @description = description
      @short_url = short_url
    end
  end
end