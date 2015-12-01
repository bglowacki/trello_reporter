require 'trello'
require 'trello_reporter/settings'

module TrelloReporter
  class Client
  include Settings

    def configure
      Trello.configure do |trello|
        trello.developer_public_key = Settings::TRELLO_KEY
        trello.member_token = Settings::OAUTH_TOKEN
      end
    end

  end
end