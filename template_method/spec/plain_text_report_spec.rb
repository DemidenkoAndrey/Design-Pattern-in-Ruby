require_relative "../plain_text_report"
describe PlainTextReport do

  let(:report) { PlainTextReport.new }

  it "method 'output_start' return nil" do
    expect(report.output_start).to eq(nil)
  end

  it "method 'output_title' puts  '**** MonthlyReport ****'" do
    expect { report.output_title}.to output("**** MonthlyReport ****\n\n").to_stdout
  end

  it "method 'output_body_start' return nil" do
    expect(report.output_body_start).to eq(nil)
  end

  it "method 'output_line' puts hello" do
    expect { report.output_line("hello") }.to output("hello\n").to_stdout
  end

  it "method 'output_body_end' return nil" do
    expect(report.output_body_end).to eq(nil)
  end

  it "method 'output_end' return nil" do
    expect(report.output_start).to eq(nil)
  end

  it "method 'output_report' raise error" do
    result = <<-PLAINT_TEXT
**** MonthlyReport ****

Things are going
really, really well.
    PLAINT_TEXT
    expect { report.output_report }.to output(result).to_stdout
  end
end
