require_relative "../html_report"
describe HTMLReport do

  let(:html_report) { HTMLReport.new }

  it "method 'output_start' puts '<html>'" do
    expect { html_report.output_start}.to output("<html>\n").to_stdout
  end

  it "method 'output_title' puts head" do
    head = <<-HEAD
  <head>
    <title>MonthlyReport</title>
  </head>
    HEAD
    expect { html_report.output_title}.to output(head).to_stdout
  end

  it "method 'output_body_start' puts '<body>'" do
    expect { html_report.output_body_start}.to output("<body>\n").to_stdout
  end

  it "method 'output_line' puts '  <p>hello</p>'" do
    expect { html_report.output_line("hello")}.to output("  <p>hello</p>\n").to_stdout
  end

  it "method 'output_body_end' puts '</body>'" do
    expect { html_report.output_body_end }.to output("</body>\n").to_stdout
  end

  it "method 'output_end' puts '</html>'" do
    expect { html_report.output_end }.to output("</html>\n").to_stdout
  end

  it "method 'output_report' puts report in html format" do
    result = <<-HTML_REPORT
<html>
  <head>
    <title>MonthlyReport</title>
  </head>
<body>
  <p>Things are going</p>
  <p>really, really well.</p>
</body>
</html>
    HTML_REPORT
    expect { html_report.output_report }.to output(result).to_stdout
  end
end
