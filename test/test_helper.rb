$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sledsheet'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "text/fixtures"
  c.hook_into :webmock
end
