require_relative "../plain_text_formatter"
require_relative "../report"

describe PLAIN_TEXT_FORMATTER do

  let (:report) { Report.new(&PLAIN_TEXT_FORMATTER) }

  it "method 'output_report' puts report in html " do
    result = <<-PLAIN_FORMAT
***** Monthly Report *****
Things are going
really, really well.
    PLAIN_FORMAT
    expect { PLAIN_TEXT_FORMATTER.call(report) }.to output(result).to_stdout
  end
end
