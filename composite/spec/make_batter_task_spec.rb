require_relative '../task'
require_relative '../composite_task'
require_relative '../make_batter_task'
require_relative '../add_dry_ingredients_task'
require_relative '../add_liquids_task'
require_relative '../mix_task'

describe MakeBatterTask do
  let(:make_batter_task) { MakeBatterTask.new }

  it 'has name Make butter' do
    expect(make_batter_task.name).to eq('Make batter')
  end

  it 'tolal number of tasks eq 3' do
    expect(make_batter_task.total_num_of_tasks).to eq(3)
  end

  it 'time required eq 6' do
    expect(make_batter_task.get_time_required).to eq(6)
  end
end
