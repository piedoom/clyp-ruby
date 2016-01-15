$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'clyp'

require 'minitest/autorun'
require 'minitest_helper'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end
