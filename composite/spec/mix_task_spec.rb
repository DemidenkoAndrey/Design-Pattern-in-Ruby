require_relative '../task'
require_relative '../mix_task'

describe MixTask do
  let(:task) { MixTask.new }

  it 'return name' do
    expect(task.name).to eq 'Mix that batter up!'
  end

  it 'return parent' do
    expect(task.parent).to be nil
  end

  it 'return time' do
    expect(task.get_time_required).to eq 3
  end
end
