#!/usr/bin/env ruby

require_relative "../lib/page_views_list"
require_relative "../lib/log_parser"

if ARGV[0].nil?
  raise "You must a file to parse as the first argument"
end

file_from_input = ARGV[0]
file = LogParser.new(file_from_input)
webpages_list = PageViewsList.new(file.import)

# list of webpages with most page views ordered from most pages views to less page

puts "list of webpages with most page views ordered from most pages views to less page views:"

webpages_list.sort_highest_page_views.each do |line|
  puts "#{line.url} #{line.views} visit#{line.views == 1? '' : 's'}"
end

puts ""
puts "list of webpages with most unique page views also ordered:"

# list of webpages with most unique page views also ordered

webpages_list.sort_unique_page_views.each do |line|
  puts "#{line.url} #{line.views} unique visit#{line.views == 1? '' : 's'}"
end