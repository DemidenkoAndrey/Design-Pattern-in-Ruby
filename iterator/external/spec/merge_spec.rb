require_relative '../array_iterator'
require_relative '../merge'

describe 'merge' do
  let(:array1) { [1, 99, 33, 55, 11, 3, 0, 1] }
  let(:array2) { [3, 4, 4, 44, 1, 15, 56, 2] }

  it 'merge 2 array' do
    result = [1, 3, 4, 4, 44, 1, 15, 56, 2, 99, 33, 55, 11, 3, 0, 1]
    expect(merge(array1, array2)).to eq result
  end
end
