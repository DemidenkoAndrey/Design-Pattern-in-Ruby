require_relative '../for_each_element'

describe 'internal iterator' do
  let(:array) { [3, 5, 14, "hello"] }
  it 'call for_each_element' do
    result = ""
    result << "3\n" << "5\n" << "14\n" << "hello\n"
    expect do
      for_each_element(array) { |element| puts element }
    end.to output(result).to_stdout
  end
end
