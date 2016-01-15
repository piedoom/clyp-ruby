module Clyp
  class ListItem
    VALID_OPTIONS_KEYS = [:title, :location]
    attr_accessor *VALID_OPTIONS_KEYS

    def initialize(t)
      @title =           t['Title']
      @location =        t['Location']
    end
  end
end