require "open-uri"
require "json"

module GitHubFeed
  class << self

    attr_reader :source, :events

    def address
      "https://api.github.com/users/" + source + "/events"
    end

    def get_events_json
      JSON.parse open(address).read
    end

    def from source
      @source = source
      @events = EventContainer.new get_events_json
      self
    end
  end

  class EventContainer

    attr_reader :events

    EVENT = {
      create: "CreateEvent",
      push: "PushEvent",
      fork: 'ForkEvent'
    }

    def find param
      events.select{|e| e.type == EVENT[param]}
    end

    def initialize events
      @events = events.map{|e| Event.new e}
    end
  end

  class Event
    def initialize event
      @event = event
    end

    def type
      @event['type']
    end
  end
end