class LogParser
  attr_accessor :file

  def initialize(file)
    self.file = file
  end

  def import
    File.open(file)
  end

  def sort_highest_page_views
    import.map(&:strip).group_by { |val| val }.map { |k, v| [k, v.size] }.sort_by { |k, v| [-v, k] }
  end
end