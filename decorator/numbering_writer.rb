class NumberingWriter < WriterDecorator
  def initialize(real_writer)
    super
    @line_number = 1
  end

  def write_line(line)
    @real_writer.write_line("#{@line_number}: #{line}")
    @line_number += 1
  end
end
