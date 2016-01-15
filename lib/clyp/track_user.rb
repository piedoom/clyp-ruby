module Clyp
  VALID_OPTIONS_KEYS = [:successful, :message, :playlist_id, :playlist_token]
  attr_accessor *VALID_OPTIONS_KEYS

  class TrackUser < Track
    def initialize t
      super(t)
      @successful      = t[:successful]
      @message         = t[:message]
      @playlist_id     = t[:playlist_id]
      @playlist_token  = t[:playlist_token]
    end
  end
end