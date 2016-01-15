module Clyp
  class Soundwave
    VALID_OPTIONS_KEYS = [:data]
    attr_accessor *VALID_OPTIONS_KEYS

    def initialize(t)
      @data =           t
    end
  end
end