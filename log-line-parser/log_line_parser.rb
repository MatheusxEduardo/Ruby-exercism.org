class LogLineParser
  def initialize(log_line)
    @log_line = log_line.strip
  end

  def message
    @log_line.split(']: ', 2)[1].strip
  end

  def log_level
    @log_line.match(/\[(.*?)\]:/)[1].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

