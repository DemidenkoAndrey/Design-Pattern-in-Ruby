require_relative '../task'
require_relative '../frost_task'

describe FrostTask do
  let(:task) { FrostTask.new }

  it 'return name' do
    expect(task.name).to eq 'Put frosting on the cake.'
  end

  it 'return parent' do
    expect(task.parent).to be nil
  end

  it 'return time' do
    expect(task.get_time_required).to eq 5
  end
end
