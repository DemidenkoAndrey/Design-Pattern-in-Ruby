require_relative "../simple_writer"
require 'timecop'
describe SimpleWriter do

  let(:file_name) { "hello.txt" }
  let(:line) { "Hello, <3" }
  let(:writer) { SimpleWriter.new(file_name) }

  it 'writer has method write_line' do
    expect(writer).to respond_to(:write_line)
  end

  it 'writer has method pos' do
    expect(writer).to respond_to(:pos)
  end

  it 'writer has method rewind' do
    expect(writer).to respond_to(:rewind)
  end

  it 'writer has method close' do
    expect(writer).to respond_to(:close)
  end

  it 'writer has method close' do
    expect(writer).to respond_to(:close)
  end

  it 'has check_sum eq 0 after initialize' do
    expect(writer.pos).to eq 0
  end

  it 'write line to file' do
    writer.write_line(line)
    writer.close
    readline = File.open(file_name, "r") { |f| f.read }
    expect(readline).to eq "#{line}\n"
  end

  it 'pos eq 6 after write_line' do
    expect { writer.write_line(line) }.to change { writer.pos }.from(0).to(11)
  end

  it 'pos eq 0 after rewind' do
    writer.write_line(line)
    expect { writer.rewind }.to change { writer.pos }.from(11).to(0)
  end
end
