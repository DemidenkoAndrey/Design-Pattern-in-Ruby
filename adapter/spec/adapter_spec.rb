require_relative '../encrypter'
require_relative '../string_io_adapter'
require_relative '../decrypter'

describe 'Adapter' do
  let(:encrypter) { Encrypter.new("h&21*z]/1") }
  let(:decrypter) { Decrypter.new("h&21*z]/1") }
  let(:string_io_adapter) { StringIOAdapter.new("Hello World") }

  it 'encrypt has method encrypt' do
    expect(encrypter.respond_to?(:encrypt)).to be true
  end

  it 'decrypt has method decrypt' do
    expect(decrypter.respond_to?(:decrypt)).to be true
  end

  it 'string_io_adapter has method getbyte' do
    expect(string_io_adapter.respond_to?(:getbyte)).to be true
  end

  it 'string_io_adapter has method eof?' do
    expect(string_io_adapter.respond_to?(:eof?)).to be true
  end

  it 'encrypt read from file and write to file' do
    reader = File.open('input.txt')
    writer = File.open('out.txt', 'w')
    encrypter = Encrypter.new('XYZZY')
    encrypter.encrypt(reader, writer)
    writer.close
    reader.close
    reader = File.open('out.txt')
    expect(reader.read).to eq("17*/-v-\".S")
    reader.close
  end

  it 'encrypt read from adapter and write to file' do
    reader = StringIOAdapter.new('We attack at dawn')
    writer = File.open('out.txt', 'w')
    encrypter = Encrypter.new('XYZZY')
    encrypter.encrypt(reader, writer)
    writer.close
    reader = File.open('out.txt')
    expect(reader.read).to eq("<z;-,891y9-z>8/7")
    reader.close
  end

  it 'decrypt read from file and decrypt' do
    reader = File.open('out.txt')
    decrypter = Decrypter.new('XYZZY')
    expect(decrypter.decrypt(reader)).to eq('We attack at dawn')
    reader.close
  end
end
