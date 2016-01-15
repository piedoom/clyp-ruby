require 'json'
API_BASE = "https://api.clyp.it"
UPLOAD_BASE = "https://upload.clyp.it/upload"

module Clyp
  class Client
    # uploads a TrackUpload object
    def upload track
      conn = Faraday.new(UPLOAD_BASE) do |f|
        f.request :multipart
        f.request :url_encoded
        f.adapter :net_http
      end
      payload = { file: Faraday::UploadIO.new(track.file, 'audio')}
      conn.post('/', { audioFile: payload, plalistId: track.playlist_id, playlistUploadToken: track.playlist_token,
      order: track.order, description: track.description, longitude: track.longitude, latitude: track.latitude})
    end

    # get song with specific id
    def get (id:)
      response = Faraday.get("#{API_BASE}/#{id}")
      attributes = JSON.parse(response.body)
      Track.new(attributes)
    end

    # returns a Soundwave object with peak data
    def soundwave (id:)
      response = Faraday.get("#{API_BASE}/#{id}/soundwave")
      attributes = JSON.parse(response.body)
      Soundwave.new(attributes)
    end

    # returns an array of ListItem objects of categories
    def category_list
      response = Faraday.get("#{API_BASE}/categorylist")
      attributes = JSON.parse(response.body)
      result = Array.new
      attributes.each do |attrs|
        result << ListItem.new(attrs)
      end
      result
    end

    # returns 20 tracks from a specified search in an array of Track objects
    def search term
      response = Faraday.get("#{API_BASE}/categorylist/#{term}")
      attributes = JSON.parse(response.body)
      result = Array.new
      attributes.each do |attrs|
        result << Track.new(attrs)
      end
      result
    end

    # returns featured tracks in an array of Track objects
    def featured (count: 10)
      response = Faraday.get("#{API_BASE}/featuredlist/featured?count=#{count}")
      attributes = JSON.parse(response.body)
      result = Array.new
      attributes.each do |attrs|
        result << Track.new(attrs)
      end
      result
    end

    # returns popular tracks in an array of Track objects
    def popular (count: 10)
      response = Faraday.get("#{API_BASE}/featuredlist/popular?count=#{count}")
      attributes = JSON.parse(response.body)
      result = Array.new
      attributes.each do |attrs|
        result << Track.new(attrs)
      end
      result
    end

    # returns random tracks in an array of Track objects
    def random (count: 10)
      response = Faraday.get("#{API_BASE}/featuredlist/random?count=#{count}")
      attributes = JSON.parse(response.body)
      result = Array.new
      attributes.each do |attrs|
        result << Track.new(attrs)
      end
      result
    end

    # returns recent tracks in an array of Track objects
    def recent (count: 10)
      response = Faraday.get("#{API_BASE}/featuredlist/recent?count=#{count}")
      attributes = JSON.parse(response.body)
      result = Array.new
      attributes.each do |attrs|
        result << Track.new(attrs)
      end
      result
    end

    # TODO:
    #def get_playlist (id: )
    #  response = Faraday.get("#{API_BASE}/playlist/#{id}")
    #  attributes = JSON.parse(response.body)
    #end

    # returns an array of nearby tracks
    def featured_nearby (count: 10, longitude: 0, latitude: 0)
      response = Faraday.get("#{API_BASE}/featuredlist/nearby?count=#{count}&longitude=#{longitude}&latitude=#{latitude}")
      attributes = JSON.parse(response.body)
      result = Array.new
      attributes.each do |attrs|
        result << Track.new(attrs)
      end
      result
    end

  end
end