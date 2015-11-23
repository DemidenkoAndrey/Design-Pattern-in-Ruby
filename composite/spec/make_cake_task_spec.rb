require_relative '../task'
require_relative '../composite_task'
require_relative '../make_batter_task'
require_relative '../add_dry_ingredients_task'
require_relative '../add_liquids_task'
require_relative '../mix_task'
require_relative '../fill_pan_task'
require_relative '../bake_task'
require_relative '../frost_task'
require_relative '../lick_spoon_task'
require_relative '../make_cake_task'

describe MakeCakeTask do
  let(:make_cake_task) { MakeCakeTask.new }

  it 'has name Make butter' do
    expect(make_cake_task.name).to eq('Make cake')
  end

  it 'tolal number of tasks eq 7' do
    expect(make_cake_task.total_num_of_tasks).to eq(7)
  end

  it 'time required eq 44' do
    expect(make_cake_task.get_time_required).to eq(44)
  end
end
