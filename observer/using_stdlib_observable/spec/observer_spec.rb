require_relative '../employee'
require_relative '../payroll'
require_relative '../tax_man'

describe 'Observer' do
  let(:employee) { Employee.new('Fred', 'Crane Operator', 30000.0) }
  let(:tax_man) { TaxMan.new }
  let(:payroll) { Payroll.new }
  it 'employee has method add_observer' do
    expect(employee.respond_to?(:add_observer)).to be true
  end

  it 'employee has method delete_observer' do
    expect(employee.respond_to?(:delete_observer)).to be true
  end

  it 'employee has method notify_observers' do
    expect(employee.respond_to?(:notify_observers)).to be true
  end

  it 'employee has method changed' do
    expect(employee.respond_to?(:changed)).to be true
  end

  it 'employee has method changed?' do
    expect(employee.respond_to?(:changed?)).to be true
  end

  it 'employee has method count_observers' do
    expect(employee.respond_to?(:count_observers)).to be true
  end

  it 'employee has method delete_observers' do
    expect(employee.respond_to?(:delete_observers)).to be true
  end

  it 'nothing output via, when list of observers is empty' do
    expect { employee.notify_observers }.to output("").to_stdout
  end

  it 'init observers count eq 0' do
    expect(employee.count_observers).to eq(0)
  end

  it 'add observer to observers via add_observer' do
    employee.add_observer(tax_man)
    expect(employee.count_observers).to eq(1)
  end

  it 'notify observer, when change salary' do
    employee.add_observer(tax_man)
    output = "Send Fred a new tax bill!\n"
    expect { employee.salary = 40000 }.to output(output).to_stdout
  end

  it 'delete observer from observers via delete_observer' do
    employee.add_observer(tax_man)
    employee.add_observer(payroll)
    employee.delete_observer(tax_man)
    expect(employee.count_observers).to eq(1)
  end

  it 'notify all observers, when change salary' do
    output = "Send Fred a new tax bill!\n"
    output << "Cut a new check for Fred!\n"
    output << "His salary is now 40000!\n"
    employee.add_observer(tax_man)
    employee.add_observer(payroll)
    expect { employee.salary = 40000 }.to output(output).to_stdout
  end

  it 'delete all observers via delete_observers' do
    employee.add_observer(tax_man)
    employee.add_observer(payroll)
    employee.delete_observers
    expect(employee.count_observers).to eq(0)
  end
end
