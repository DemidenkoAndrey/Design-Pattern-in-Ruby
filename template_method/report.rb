class Report
  def initialize
    @title = "MonthlyReport"
    @text = ["Things are going", "really, really well."]
  end

  def output_report
    body = @text.map { |line| output_line(line) }.join("\n")
    [output_start, output_title, output_body_start, body,
     output_body_end, output_end
    ].join("\n")
  end

  def output_start
  end

  def output_title
    output_line(@title)
  end

  def output_body_start
  end

  def output_line(line)
    fail "Called abastract method: output_line"
  end

  def output_body_end
  end

  def output_end
  end
end
