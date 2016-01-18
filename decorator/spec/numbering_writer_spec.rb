require_relative "../simple_writer"
require_relative "../writer_decorator"
require_relative "../numbering_writer"

describe WriterDecorator do

  let(:file_name) { "hello.txt" }
  let(:line) { "Hello, <3" }
  let(:simple_writer) { SimpleWriter.new(file_name) }
  let(:numbering_writer) { NumberingWriter.new(simple_writer) }

  it 'writer has method write_line' do
    expect(numbering_writer).to respond_to(:write_line)
  end

  it 'writer has method pos' do
    expect(numbering_writer).to respond_to(:pos)
  end

  it 'writer has method rewind' do
    expect(numbering_writer).to respond_to(:rewind)
  end

  it 'writer has method close' do
    expect(numbering_writer).to respond_to(:close)
  end

  it 'writer has method close' do
    expect(numbering_writer).to respond_to(:close)
  end

  it 'has check_sum eq 0 after initialize' do
    expect(numbering_writer.pos).to eq 0
  end

  it 'write line to file' do
    numbering_writer.write_line(line)
    numbering_writer.close
    readline = File.open(file_name, "r") { |f| f.read }
    expect(readline).to eq "1: #{line}\n"
  end

  it 'pos eq 6 after write_line' do
    expect { numbering_writer.write_line(line) }.to change { numbering_writer.pos }.from(0).to(14)
  end

  it 'pos eq 0 after rewind' do
    numbering_writer.write_line(line)
    expect { numbering_writer.rewind }.to change { numbering_writer.pos }.from(14).to(0)
  end
end
