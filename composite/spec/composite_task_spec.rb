require_relative '../task'
require_relative '../composite_task'
require_relative '../mix_task'
require_relative '../frost_task'

describe CompositeTask do
  let(:composite) { CompositeTask.new('Do many task') }
  let(:mix_task) { MixTask.new }
  let(:frost_task) { FrostTask.new }

  it 'has method add_sub_task' do
    expect(composite.respond_to?(:add_sub_task)).to be true
  end

  it 'has method remove_sub_task' do
    expect(composite.respond_to?(:remove_sub_task)).to be true
  end

  it 'has method []' do
    expect(composite.respond_to?(:[])).to be true
  end

  it 'has method []=' do
    expect(composite.respond_to?(:[]=)).to be true
  end

  it 'has method <<' do
    expect(composite.respond_to?(:<<)).to be true
  end

  it 'return name' do
    expect(composite.name).to eq 'Do many task'
  end

  it 'set parent after initialize eq 0' do
    expect(composite.parent).to be nil
  end

  it 'set time after initialize eq 0' do
    expect(composite.get_time_required).to eq 0
  end

  it 'set number of tasks after initialize eq 0' do
    expect(composite.total_num_of_tasks).to eq 0
  end

  it 'increment number of tasks by 1 after add task' do
    composite << mix_task
    expect(composite.total_num_of_tasks).to eq 1
  end

  it 'set time after add task eq task time' do
    composite << mix_task
    expect(composite.get_time_required).to eq 3
  end

  it 'set number of tasks after add 2 task eq 2' do
    composite << mix_task
    composite << frost_task
    expect(composite.total_num_of_tasks).to eq 2
  end

  it 'set time after add 2 task eq sum of tasks' do
    composite << mix_task
    composite << frost_task
    expect(composite.get_time_required).to eq 8
  end

  it 'decrement number of tasks by 1 after remove task' do
    composite << mix_task
    composite << frost_task
    composite.remove_sub_task(frost_task)
    expect(composite.total_num_of_tasks).to eq 1
  end

  it 'set time after remove task' do
    composite << mix_task
    composite << frost_task
    composite.remove_sub_task(frost_task)
    expect(composite.get_time_required).to eq 3
  end

  it 'set parent' do
    composite << mix_task
    expect(mix_task.parent).to eq composite
  end

  it 'remove parent' do
    composite << mix_task
    composite.remove_sub_task(mix_task)
    expect(mix_task.parent).to be nil
  end

  it 'return task via []' do
    composite << mix_task
    composite << frost_task
    expect(composite[1]).to eq frost_task
  end

  it 'can set task via []' do
    composite << mix_task
    composite << frost_task
    composite[0] = frost_task
    expect(composite[1]).to eq frost_task
  end
end
