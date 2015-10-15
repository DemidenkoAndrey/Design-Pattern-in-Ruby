require_relative "../plain_text_formatter"
require_relative "../report"

describe PlainTextFormatter do

  let (:report) { Report.new(PlainTextFormatter) }

  it "method 'output_report' puts report in plain format " do
    result = <<-PLAIN_FORMAT
***** Monthly Report *****
Things are going
really, really well.
  PLAIN_FORMAT
    expect { PlainTextFormatter.output_report(report) }.to output(result).to_stdout
  end
end
