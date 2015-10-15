require_relative "../plain_text_formatter"
require_relative "../html_formatter"
require_relative "../report"

describe Report do

  let (:report_html) { Report.new(&HTML_FORMATTER) }
  let (:report_plain) { Report.new(&PLAIN_TEXT_FORMATTER) }

  it "report_plain method 'output_report' puts report in plain format " do
    result = <<-PLAIN_FORMAT
***** Monthly Report *****
Things are going
really, really well.
  PLAIN_FORMAT
    expect { report_plain.output_report }.to output(result).to_stdout
  end

  it "report_html  method 'output_report' puts report in html " do
    result = <<-HTML_FORMATTER
<html>
  <head>
    <title>Monthly Report</title>
  </head>
  <body>
    <p>Things are going</p>
    <p>really, really well.</p>
  </body>
</html>
    HTML_FORMATTER
    expect { report_html.output_report }.to output(result).to_stdout
  end
end
