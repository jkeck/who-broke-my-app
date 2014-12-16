require 'active_support/all'
require 'json'
require 'bundler'
require 'faraday'
require 'optparse'

options = {days: 1}
OptionParser.new do |opts|
  opts.banner = "Usage: who-broke-my-app.rb [options]"

  opts.on("-p [PATH]", "--path [PATH]", String, "Path to the Gemfile.lock") do |path|
    options[:path] = path
  end

  opts.on("-d [DAYS]", "--days [DAYS]", "Number of days to to search (default is 1)") do |days|
    options[:days] = days
  end

end.parse!


version_api = "https://rubygems.org/api/v1/versions"
lockfile = Bundler::LockfileParser.new(Bundler.read_file(options[:path]))
date = options[:days].to_i.days.ago

lockfile.specs.map do |gem|
  versions = Faraday.get("#{version_api}/#{gem.name}.json").body
  version = JSON.parse(versions).find do |v|
    v['number'] == gem.version.to_s && Time.parse(v['built_at']) > date
  end
  puts "#{gem.name} was released on #{version['built_at']}" if version
end