class LogParser
  attr_accessor :file

  def initialize(file)
    self.file = file
  end

  def import
    File.open(file)
  end
end