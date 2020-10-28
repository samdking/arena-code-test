PageView = Struct.new(:url, :views)

class WebpagesList
  attr_accessor :contents

  def initialize(contents)
    self.contents = contents
  end

  def sort_highest_page_views
    contents
      .map { |line| line.split(' ').first }
      .group_by(&:itself)
      .map { |url, occurences| [url, occurences.size] }
      .sort_by { |k, v| [-v, k] }
      .map { |k, v| PageView.new(k, v) }
  end

  def sort_unique_page_views
    contents
      .map { |line| line.split(' ') }
      .group_by { |url, ip| url }
      .map { |url, occurences| [url, occurences.map(&:last).uniq.size] }
      .sort_by { |k, v| [-v, k] }
      .map { |k, v| PageView.new(k, v) }
  end
end