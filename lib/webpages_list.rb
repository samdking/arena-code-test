class WebpagesList
  attr_accessor :contents

  def initialize(contents)
    self.contents = contents
  end

  def sort_highest_page_views
    contents
      .map(&:strip)
      .group_by { |val| val }
      .map { |k, v| [k, v.size] }
      .sort_by { |k, v| [-v, k] }
  end
end