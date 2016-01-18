require_relative "../simple_writer"
require_relative "../writer_decorator"
require_relative "../time_stamping_writer"

describe WriterDecorator do

  let(:file_name) { "hello.txt" }
  let(:line) { "Hello, <3" }
  let(:simple_writer) { SimpleWriter.new(file_name) }
  let(:time_stamping_writer) { TimeStampingWriter.new(simple_writer) }

  it 'writer has method write_line' do
    expect(time_stamping_writer).to respond_to(:write_line)
  end

  it 'writer has method pos' do
    expect(time_stamping_writer).to respond_to(:pos)
  end

  it 'writer has method rewind' do
    expect(time_stamping_writer).to respond_to(:rewind)
  end

  it 'writer has method close' do
    expect(time_stamping_writer).to respond_to(:close)
  end

  it 'writer has method close' do
    expect(time_stamping_writer).to respond_to(:close)
  end

  it 'has pos eq 0 after initialize' do
    expect(time_stamping_writer.pos).to eq 0
  end

  it 'write line with time' do
    Timecop.freeze(Time.new)
    time_stamping_writer.write_line(line)
    time_stamping_writer.close
    readline = File.open(file_name, "r") { |f| f.read }
    expect(readline).to eq "#{Time.new}: #{line}\n"
    Timecop.return
  end

  it 'pos eq 38 after write_line' do
    expect { time_stamping_writer.write_line(line) }.to change { time_stamping_writer.pos }.from(0).to(38)
  end

  it 'pos eq 0 after rewind' do
    time_stamping_writer.write_line(line)
    expect { time_stamping_writer.rewind }.to change { time_stamping_writer.pos }.from(38).to(0)
  end
end
