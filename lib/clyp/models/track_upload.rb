module Clyp
  class TrackUpload
    VALID_OPTIONS_KEYS = [:file, :playlist_id, :playlist_token, :order, :description, :longitude, :latitude]
    attr_accessor *VALID_OPTIONS_KEYS

    def initialize(t={})
      @file =               t[:file]
      @playlist_id =          t[:playlist_id]
      @playlist_token =       t[:playlist_token]
      @order =                t[:order]
      @description =          t[:description]
      @longitude =            t[:longitude]
      @latitude =             t[:latitude]
    end

  end
end