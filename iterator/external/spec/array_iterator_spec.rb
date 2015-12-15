require_relative '../array_iterator'
describe ArrayIterator do
  let(:string_iterator) { ArrayIterator.new('hello world') }
  let(:array_iterator) { ArrayIterator.new([1,4,6,'hello', 'matz']) }

  it 'string_iterator has method has_next'  do
    expect(string_iterator).to respond_to(:has_next?)
  end

  it 'string_iterator has method item'  do
    expect(string_iterator).to respond_to(:item)
  end

  it 'string_iterator has method next_item'  do
    expect(string_iterator).to respond_to(:next_item)
  end

  it 'string_iterator return true if current index < size' do
    expect(string_iterator.has_next?).to be true
  end

  it 'string_iterator.has_next? return false if current index >= size' do
    while string_iterator.has_next?
      string_iterator.next_item
    end
    expect(string_iterator.has_next?).to be false
  end

  it 'string_iterator.has_next? return false if current index >= size' do
    while string_iterator.has_next?
      string_iterator.next_item
    end
    expect(string_iterator.has_next?).to be false
  end

  it 'get 2nd item of string_iterator after call next_item 2 times' do
    string_iterator.next_item
    letter = string_iterator.next_item
    expect(letter).to eq('e')
  end

  it 'string_iterator.next_item return nil after call next_item more than
      string_iterator.size' do
    50.times { string_iterator.next_item }
    letter = string_iterator.next_item
    expect(letter).to be nil
  end

  it 'array_iterator has method has_next'  do
    expect(array_iterator.respond_to?(:has_next?)).to be true
  end

  it 'array_iterator has method item'  do
    expect(array_iterator.respond_to?(:item)).to be true
  end

  it 'array_iterator has method next_item'  do
    expect(array_iterator.respond_to?(:next_item)).to be true
  end

  it 'array_iterator return true if current index < size' do
    expect(array_iterator.has_next?).to be true
  end

  it 'array_iterator.has_next? return false if current index >= size' do
    while array_iterator.has_next?
      array_iterator.next_item
    end
    expect(array_iterator.has_next?).to be false
  end

  it 'array_iterator.has_next? return false if current index >= size' do
    while array_iterator.has_next?
      array_iterator.next_item
    end
    expect(array_iterator.has_next?).to be false
  end

  it 'get 4th item of array_iterator after call next_item 4 times' do
    3.times { array_iterator.next_item }
    element = array_iterator.next_item
    expect(element).to eq('hello')
  end

  it 'array_iterator.next_item return nil after call next_item more than
      array_iterator.size' do
    50.times { array_iterator.next_item }
    element = array_iterator.next_item
    expect(element).to be nil
  end
end
