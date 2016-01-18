require_relative "../simple_writer"
require_relative "../writer_decorator"
require_relative "../check_summing_writer"

describe WriterDecorator do

  let(:file_name) { "hello.txt" }
  let(:line) { "Hello, <3" }
  let(:simple_writer) { SimpleWriter.new(file_name) }
  let(:check_summing_writer) { CheckSummingWriter.new(simple_writer) }

  it 'writer has method write_line' do
    expect(check_summing_writer).to respond_to(:write_line)
  end

  it 'writer has method write_line' do
    expect(check_summing_writer).to respond_to(:checksumming_write_line)
  end

  it 'writer has method pos' do
    expect(check_summing_writer).to respond_to(:pos)
  end

  it 'writer has method rewind' do
    expect(check_summing_writer).to respond_to(:rewind)
  end

  it 'writer has method close' do
    expect(check_summing_writer).to respond_to(:close)
  end

  it 'writer has method close' do
    expect(check_summing_writer).to respond_to(:close)
  end

  it 'has pos eq 0 after initialize' do
    expect(check_summing_writer.pos).to eq 0
  end

  it 'has check_sum eq 0 after initialize' do
    expect(check_summing_writer.check_sum).to eq 0
  end

  it 'write line to file' do
    check_summing_writer.write_line(line)
    check_summing_writer.close
    readline = File.open(file_name, "r") { |f| f.read }
    expect(readline).to eq "#{line}\n"
  end

  it 'pos eq 11 after write_line' do
    expect { check_summing_writer.write_line(line) }.to change { check_summing_writer.pos }.from(0).to(11)
  end

  it 'pos eq 0 after rewind' do
    check_summing_writer.write_line(line)
    expect { check_summing_writer.rewind }.to change { check_summing_writer.pos }.from(11).to(0)
  end

  it 'check_sum eq 11 after checksumming_write_line' do
    expect { check_summing_writer.checksumming_write_line(line) }.to change { check_summing_writer.check_sum }.from(0).to(185)
  end

  it 'read check_sum eq instance check_sum' do
    read_sum = 0
    check_summing_writer.checksumming_write_line(line)
    check_summing_writer.close
    file = File.open(file_name, "r")
    file.each_byte { |byte| read_sum = (read_sum + byte) % 256; }
    expect(read_sum).to eq check_summing_writer.check_sum
  end
end
