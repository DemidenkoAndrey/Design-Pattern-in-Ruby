require_relative "../enchanced_writer"
require 'timecop'
describe EnchancedWriter do

  let(:file_name) { "hello.txt" }
  let(:line) { "Hello, <3" }
  let(:writer) { EnchancedWriter.new(file_name) }

  it 'writer has method write_line' do
    expect(writer).to respond_to(:write_line)
  end

  it 'writer has method checksumming_write_line' do
    expect(writer).to respond_to(:checksumming_write_line)
  end

  it 'writer has method timestamping_write_line' do
    expect(writer).to respond_to(:timestamping_write_line)
  end

  it 'writer has method numbering_write_line' do
    expect(writer).to respond_to(:numbering_write_line)
  end

  it 'writer has method close' do
    expect(writer).to respond_to(:close)
  end

  it 'has check_sum eq 0 after initialize' do
    expect(writer.check_sum).to eq 0
  end

  it 'write line to file' do
    writer.write_line(line)
    writer.close
    readline = File.open(file_name, "r") { |f| f.read }
    expect(readline).to eq "#{line}\n"
  end

  it 'checksumming_write_line change check_sum' do
    expect { writer.checksumming_write_line(line) }.to change { writer.check_sum }.from(0).to(185)
    writer.close
  end

  it 'timestamping_write_line write line with Time' do
    Timecop.freeze(Time.new)
    writer.timestamping_write_line(line)
    writer.close
    readline = File.open(file_name, "r") { |f| f.read }
    expect(readline).to eq "#{Time.new}: #{line}\n"
    Timecop.return
  end

  it 'numbering_write_line write line with line' do
    Timecop.freeze(Time.new)
    writer.timestamping_write_line(line)
    writer.close
    readline = File.open(file_name, "r") { |f| f.read }
    expect(readline).to eq "#{Time.new}: #{line}\n"
    Timecop.return
  end
end
