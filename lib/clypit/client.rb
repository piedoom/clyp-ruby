require 'json'
API_BASE = "https://api.clyp.it"

module Clypit
  class Client
    def upload
      response = Faraday.get("#{API_BASE}")
      attributes = JSON.parse(response.body)
    end

    # get song with id
    def get (id:)
      response = Faraday.get("#{API_BASE}/#{id}")
      attributes = JSON.parse(response.body)
      Track.new(attributes)
    end

    def soundwave (id:)
      response = Faraday.get("#{API_BASE}/#{id}/soundwave")
      attributes = JSON.parse(response.body)
    end

    def categories
      response = Faraday.get("#{API_BASE}/categorylist")
      attributes = JSON.parse(response.body)
    end

    def featured
      response = Faraday.get("#{API_BASE}/featuredlist")
      attributes = JSON.parse(response.body)
    end

    def popular (count: 10)
      response = Faraday.get("#{API_BASE}/featuredlist/popular?count=#{count}")
      attributes = JSON.parse(response.body)
      result = Array.new
      attributes.each do |attrs|
        result << Track.new(attrs)
      end
      return result
    end

    def get_playlist (id: )
      response = Faraday.get("#{API_BASE}/playlist/?id=#{id}")
      attributes = JSON.parse(response.body)
    end

    def random (count: 10)
      response = Faraday.get("#{API_BASE}/featuredlist/random?count=#{count}")
      attributes = JSON.parse(response.body)
    end

    def featured_nearby (count: 10, longitude: 0, latitude: 0)
      response = Faraday.get("#{API_BASE}/featuredlist/nearby?count=#{count}&longitude=#{longitude}&latitude=#{latitude}")
      attributes = JSON.parse(response.body)
    end

  end
end