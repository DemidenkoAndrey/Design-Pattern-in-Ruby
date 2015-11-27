require_relative '../command'

describe Command do
  let(:command) { Command.new('CommandDescription') }

  it 'has method execute' do
    expect(command.respond_to?(:execute)).to be true
  end

  it 'has method description' do
    expect(command.respond_to?(:description)).to be true
  end

  it 'has method unexecute' do
    expect(command.respond_to?(:unexecute)).to be true
  end

  it 'return description' do
    expect(command.description).to eq('CommandDescription')
  end
end
