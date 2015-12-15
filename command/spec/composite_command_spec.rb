require_relative '../command'
require_relative '../composite_command'
require_relative '../create_file'
require_relative '../copy_file'
require_relative '../delete_file'

describe CompositeCommand do
  let(:commposite_command) { CompositeCommand.new }
  let(:create_file) { CreateFile.new('1.txt', 'Content') }
  let(:copy_file) { CopyFile.new('1.txt', '2.txt') }

  it 'has methods add_command' do
    expect(commposite_command).to respond_to(:add_command)
  end

  it 'init description is empty string' do
    expect(commposite_command.description).to eq("")
  end

  it 'description set from commands' do
    result = "Create file: 1.txt\n"
    commposite_command.add_command(create_file)
    expect(commposite_command.description).to eq(result)
  end

  it 'description set from commands' do
    result = "Create file: 1.txt\n"
    result << "Copy file: 1.txt to 2.txt\n"
    commposite_command.add_command(create_file)
    commposite_command.add_command(copy_file)
    expect(commposite_command.description).to eq(result)
  end
end
