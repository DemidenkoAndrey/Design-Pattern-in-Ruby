require_relative '../task'
require_relative '../fill_pan_task'

describe FillPanTask do
  let(:task) { FillPanTask.new }

  it 'return name' do
    expect(task.name).to eq 'Fill the pan'
  end

  it 'return parent' do
    expect(task.parent).to be nil
  end

  it 'return time' do
    expect(task.get_time_required).to eq 1
  end
end
