PageView = Struct.new(:url, :views)

class WebpagesList
  attr_accessor :contents

  def initialize(contents)
    self.contents = contents
  end

  def sort_highest_page_views
    contents_by_url
      .map { |url, ips| PageView.new(url, ips.size) }
      .sort_by { |page_view| [-page_view.views, page_view.url] }
  end

  def sort_unique_page_views
    contents_by_url
      .map { |url, ips| PageView.new(url, ips.uniq.size) }
      .sort_by { |page_view| [-page_view.views, page_view.url] }
  end

  private

  def contents_by_url
    contents
      .map { |line| line.split(' ') }
      .group_by { |url, ip| url }
      .map { |url, views| [url, views.map(&:last)] }
  end
end