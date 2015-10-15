require_relative "../html_formatter"
require_relative "../report"

describe HTMLFormatter do

  let (:report) { Report.new(HTMLFormatter) }

  it "method 'output_report' puts report in html " do
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
    expect { HTMLFormatter.output_report(report) }.to output(result).to_stdout
  end
end
