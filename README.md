# Clyp

Clyp is an unofficial API wrapper for the audio sharing website http://clyp.it  With this gem, you can view, search, and upload your own files.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clyp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clyp

## Usage

To use the `clyp` gem, include this in your files

    require `clyp`

### Uploading a file

First, create a `TrackUpload` object, and set the parameters to your liking.

    track = Clyp::TrackUpload.new(file: File.new('../test/files/sample.mp3'), title: 'Test', description: '#cool test')

Create a client object to manage the API.

    client = Clyp::Client.new

Finally, Pass in your `TrackUpload` object

    my_upload = client.upload(track)

The upload function will return a `TrackUser` object.  For instance, to access the new `url`, perform the following

    my_upload.url
    >> https://clyp.it/qvneogei

You can also access direct MP3 links, the date uploaded, and more.


### More API functions

Search for tracks:

    client = Clyp::Client.new
    client.search 'guitar'

Get random tracks:

    client = Clyp::Client.new
    client.random(count: 5)

Get popular tracks:

    client = Clyp::Client.new
    client.popular(count: 3)

Chain functions:

    client = Clyp::Client.new
    client.get(id: client.search('piano').first.id)

There are more functions available in the documentation.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/piedoom/clyp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
