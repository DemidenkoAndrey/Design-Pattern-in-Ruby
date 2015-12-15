require_relative '../command'

describe Command do
  let(:command) { Command.new('CommandDescription') }

  it 'has method execute' do
    expect(command).to respond_to(:execute)
  end

  it 'has method description' do
    expect(command).to respond_to(:description)
  end

  it 'has method unexecute' do
    expect(command).to respond_to(:unexecute)
  end

  it 'return description' do
    expect(command.description).to eq('CommandDescription')
  end
end
