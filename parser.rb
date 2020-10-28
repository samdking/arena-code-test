#!/usr/bin/env ruby

require_relative "lib/webpages_list"
require_relative "lib/log_parser"

file_from_input = ARGV[0]
file = LogParser.new(file_from_input)
webpages_list = WebpagesList.new(file.import)

# list of webpages with most page views ordered from most pages views to less page

webpages_list.sort_highest_page_views.each do |line|
  puts "#{line.url} #{line.views} visits"
end

# list of webpages with most unique page views also ordered

webpages_list.sort_unique_page_views.each do |line|
  puts "#{line.url} #{line.views} unique visits"
end

puts "it works!"