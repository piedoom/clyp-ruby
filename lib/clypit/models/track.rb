class Track
  VALID_OPTIONS_KEYS = [:status, :comments_enabled, :category, :id, :title, :description, :duration, :url, :url_secure_mp3,
                        :url_mp3, :url_ogg, :url_secure_ogg, :longitude, :latitude, :date]
  attr_accessor *VALID_OPTIONS_KEYS

  def initialize(t={})
    @status =           t['Status']
    @comments_enabled = t['CommentsEnabled']
    @category =         t['Category']
    @id =               t['AudioFileId']
    @title =            t['Title']
    @description =      t['Description']
    @duration =         t['Duration']
    @url =              t['Url']
    @url_mp3 =          t['Mp3Url']
    @url_secure_mp3 =   t['SecureMp3Url']
    @url_ogg =          t['OggUrl']
    @url_secure_ogg =   t['SecureOggUrl']
    @longitude =        t['Longitude']
    @latitude =         t['Latitude']
    @date =             t['DateCreated']
  end

end