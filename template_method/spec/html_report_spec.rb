require_relative '../html_report'
describe Report do

  let(:report) { HTMLReport.new }

  it "method 'output_start' puts '<html>'" do
    expect { report.output_start}.to output("<html>\n").to_stdout
  end

  it "method 'output_title' puts head" do
    head = <<-HEAD
  <head>
    <title>MonthlyReport</title>
  </head>
    HEAD
    expect { report.output_title}.to output(head).to_stdout
  end

  it "method 'output_body_start' puts '<body>'" do
    expect { report.output_body_start}.to output("<body>\n").to_stdout
  end

  it "method 'output_line' puts '  <p>hello</p>'" do
    expect { report.output_line("hello")}.to output("  <p>hello</p>\n").to_stdout
  end

  it "method 'output_body_end' puts '</body>'" do
    expect { report.output_body_end }.to output("</body>\n").to_stdout
  end

  it "method 'output_end' puts '</html>'" do
    expect { report.output_end }.to output("</html>\n").to_stdout
  end

  it "method 'output_report' raise error" do
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
    expect { report.output_report }.to output(result).to_stdout
  end
end
