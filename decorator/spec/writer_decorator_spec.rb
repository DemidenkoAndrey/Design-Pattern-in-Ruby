require_relative "../simple_writer"
require_relative "../writer_decorator"
require 'timecop'
describe WriterDecorator do

  let(:file_name) { "hello.txt" }
  let(:line) { "Hello, <3" }
  let(:simple_writer) { SimpleWriter.new(file_name) }
  let(:writer_decorator) { WriterDecorator.new(simple_writer) }

  it 'writer has method write_line' do
    expect(writer_decorator).to respond_to(:write_line)
  end

  it 'writer has method pos' do
    expect(writer_decorator).to respond_to(:pos)
  end

  it 'writer has method rewind' do
    expect(writer_decorator).to respond_to(:rewind)
  end

  it 'writer has method close' do
    expect(writer_decorator).to respond_to(:close)
  end

  it 'writer has method close' do
    expect(writer_decorator).to respond_to(:close)
  end

  it 'has check_sum eq 0 after initialize' do
    expect(writer_decorator.pos).to eq 0
  end

  it 'write line to file' do
    writer_decorator.write_line(line)
    writer_decorator.close
    readline = File.open(file_name, "r") { |f| f.read }
    expect(readline).to eq "#{line}\n"
  end

  it 'pos eq 6 after write_line' do
    expect { writer_decorator.write_line(line) }.to change { writer_decorator.pos }.from(0).to(11)
  end

  it 'pos eq 0 after rewind' do
    writer_decorator.write_line(line)
    expect { writer_decorator.rewind }.to change { writer_decorator.pos }.from(11).to(0)
  end
end
