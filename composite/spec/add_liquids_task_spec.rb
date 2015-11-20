require_relative '../task'
require_relative '../add_liquids_task'

describe AddLiquidsTask do
  let(:task) { AddLiquidsTask.new }

  it 'return name' do
    expect(task.name).to eq 'Add liquids'
  end

  it 'return parent' do
    expect(task.parent).to be nil
  end

  it 'return time' do
    expect(task.get_time_required).to eq 2
  end
end
