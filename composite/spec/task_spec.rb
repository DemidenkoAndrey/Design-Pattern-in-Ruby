require_relative '../task'

describe Task do
  let(:task) { Task.new('run') }

  it 'has method get_time_required' do
    expect(task).to respond_to(:get_time_required)
  end

  it 'has method name' do
    expect(task).to respond_to(:name)
  end

  it 'has method name=' do
    expect(task).not_to respond_to(:name=)
  end

  it 'has method parent' do
    expect(task).to respond_to(:parent)
  end

  it 'has method parent' do
    expect(task).to respond_to(:parent=)
  end

  it 'has method total_num_of_tasks' do
    expect(task).to respond_to(:total_num_of_tasks)
  end

  it 'return name' do
    expect(task.name).to eq 'run'
  end

  it 'return parent' do
    expect(task.parent).to be nil
  end

  it 'return time' do
    expect(task.get_time_required).to eq 0
  end

  it 'return number of tasks' do
    expect(task.total_num_of_tasks).to eq 1
  end
end
