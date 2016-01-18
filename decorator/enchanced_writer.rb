class EnchancedWriter
  attr_reader :check_sum

  def initialize(path)
    @file = File.open(path, "w")
    @check_sum = 0
    @line_number = 1
  end

  def write_line(line)
    @file.print(line)
    @file.print("\n")
  end

  def checksumming_write_line(line)
    line.each_byte { |byte| @check_sum = (@check_sum + byte) % 256 }
    @check_sum += "\n".ord % 256
    write_line(line)
  end

  def timestamping_write_line(line)
    write_line("#{Time.new}: #{line}")
  end

  def numbering_write_line(line)
    write_line("#{@line_number}: #{line}")
    @line_number += 1
  end

  def close
    @file.close
  end
end
