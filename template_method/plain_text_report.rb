require_relative "report"
class PlainTextReport < Report
  def output_title
    puts "**** #{@title} ****"
    puts
  end

  def output_line(line)
    puts line
  end
end
