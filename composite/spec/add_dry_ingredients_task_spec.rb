require_relative '../task'
require_relative '../add_dry_ingredients_task'

describe AddDryIngredientsTask do
  let(:task) { AddDryIngredientsTask.new }

  it 'return name' do
    expect(task.name).to eq 'Add dry ingredients'
  end

  it 'return parent' do
    expect(task.parent).to be nil
  end

  it 'return time' do
    expect(task.get_time_required).to eq 1
  end
end
