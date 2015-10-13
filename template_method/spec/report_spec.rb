require_relative '../report'
describe Report do

  let(:report) { Report.new }

  it "method 'output_start' return nil" do
    expect(report.output_start).to eq(nil)
  end

  it "method 'output_title' raise error" do
    expect { report.output_title }.to raise_error(RuntimeError, "Called abastract method: output_line")
  end

  it "method 'output_body_start' return nil" do
    expect(report.output_body_start).to eq(nil)
  end

  it "method 'output_line' raise error" do
    expect { report.output_line("hello") }.to raise_error(RuntimeError, "Called abastract method: output_line")
  end

  it "method 'output_body_end' return nil" do
    expect(report.output_body_end).to eq(nil)
  end

  it "method 'output_end' return nil" do
    expect(report.output_start).to eq(nil)
  end

  it "method 'output_report' raise error" do
    expect { report.output_report }.to raise_error(RuntimeError, "Called abastract method: output_line")
  end
end
