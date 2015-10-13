require_relative '../html_report'
describe Report do

  let(:report) { HTMLReport.new }

  it "method 'output_start' return '<html>'" do
    expect(report.output_start).to eq("<html>")
  end

  it "method 'output_title' return head" do
    head = <<-HTML_HEAD
  <head>
    <title>MonthlyReport</title>
  </head>
    HTML_HEAD
    expect(report.output_title).to eq(head.chomp)
  end

  it "method 'output_body_start' return '<body>'" do
    expect(report.output_body_start).to eq("<body>")
  end

  it "method 'output_line' return '<p>hello</p>'" do
    expect(report.output_line("hello")).to eq("  <p>hello</p>")
  end

  it "method 'output_body_end' return '</body>'" do
    expect(report.output_body_end).to eq("</body>")
  end

  it "method 'output_end' return '</html>'" do
    expect(report.output_end).to eq("</html>")
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
    expect(report.output_report).to eq(result.chomp)
  end
end
