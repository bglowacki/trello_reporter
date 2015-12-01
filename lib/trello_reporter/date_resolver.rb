require 'chronic'

module TrelloReporter
  class DateResolver
    def resolve(date_marker)
      return Chronic.parse("last friday").to_date if Date.today.monday? && date_marker == "last workday"
      return Chronic.parse("yesterday").to_date if date_marker == "last workday"
      return Chronic.parse(date_marker).to_date
    end
  end
end