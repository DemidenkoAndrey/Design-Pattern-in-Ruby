require_relative '../task'
require_relative '../lick_spoon_task'

describe LickSpoonTask do
  let(:task) { LickSpoonTask.new }

  it 'return name' do
    expect(task.name).to eq 'Lick spoon after all'
  end

  it 'return parent' do
    expect(task.parent).to be nil
  end

  it 'return time' do
    expect(task.get_time_required).to eq 2
  end
end
