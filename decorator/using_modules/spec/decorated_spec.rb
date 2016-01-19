require_relative "../../simple_writer"
require_relative "../numbering_writer"
require_relative "../time_stamping_writer"
require 'timecop'

describe "Decorator via modules" do

  let(:file_name) { "hello.txt" }
  let(:line) { "Hello, <3" }
  let(:writer) { SimpleWriter.new(file_name) }
  let(:decorated_writer) { writer.extend(NumberingWriter); writer.extend(TimeStampingWriter) }

  it 'decorated_writer has method write_line' do
    expect(decorated_writer).to respond_to(:write_line)
  end

  it 'decorated_writer has method pos' do
    expect(decorated_writer).to respond_to(:pos)
  end

  it 'decorated_writer has method rewind' do
    expect(decorated_writer).to respond_to(:rewind)
  end

  it 'decorated_writer has method close' do
    expect(decorated_writer).to respond_to(:close)
  end

  it 'decorated_writer has method close' do
    expect(decorated_writer).to respond_to(:close)
  end

  it 'has pos eq 0 after initialize' do
    expect(decorated_writer.pos).to eq 0
  end

  it 'write line to file' do
    Timecop.freeze(Time.new)
    decorated_writer.write_line(line)
    decorated_writer.close
    readline = File.open(file_name, "r") { |f| f.read }
    expect(readline).to eq "1: #{Time.new}: #{line}\n"
    Timecop.return
  end

  it 'pos eq 41 after write_line' do
    expect { decorated_writer.write_line(line) }.to change { decorated_writer.pos }.from(0).to(41)
  end

  it 'pos eq 0 after rewind' do
    decorated_writer.write_line(line)
    expect { decorated_writer.rewind }.to change { decorated_writer.pos }.from(41).to(0)
  end
end
