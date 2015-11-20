require_relative '../task'
require_relative '../bake_task'

describe BakeTask do
  let(:task) { BakeTask.new }

  it 'return name' do
    expect(task.name).to eq 'Bake the cake'
  end

  it 'return parent' do
    expect(task.parent).to be nil
  end

  it 'return time' do
    expect(task.get_time_required).to eq 30
  end
end
