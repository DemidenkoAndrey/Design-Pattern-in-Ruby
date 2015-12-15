require_relative '../subject'
require_relative '../../employee'

describe 'Observer' do
  let(:employee) { Employee.new('Fred', 'Crane Operator', 30000.0) }
  let(:payroll) do
    Proc.new do |changed_employee|
      puts "Cut a new check for #{changed_employee.name}!"
      puts "His salary is now #{changed_employee.salary}!"
    end
  end
  let(:tax_man) do
    Proc.new do |changed_employee|
      puts "Send Fred a new tax bill!"
    end
  end

  it 'employee has method add_observer' do
    expect(employee).to respond_to(:add_observer)
  end

  it 'employee has method delete_observer' do
    expect(employee).to respond_to(:delete_observer)
  end

  it 'employee has method notify_observers' do
    expect(employee).to respond_to(:notify_observers)
  end

  it 'employee has method count_observers' do
    expect(employee).to respond_to(:count_observers)
  end

  it 'nothing output via, when list of observers is empty' do
    expect { employee.notify_observers }.to output("").to_stdout
  end

  it 'init observers count eq 0' do
    expect(employee.count_observers).to eq(0)
  end

  it 'add observer to observers via add_observer' do
    employee.add_observer(&payroll)
    expect(employee.count_observers).to eq(1)
  end

  it 'notify observer, when change salary' do
    employee.add_observer(&tax_man)
    output = "Send Fred a new tax bill!\n"
    expect { employee.salary = 40000 }.to output(output).to_stdout
  end

  it 'delete observer from observers via delete_observer' do
    employee.add_observer(&tax_man)
    employee.add_observer(&payroll)
    employee.delete_observer(tax_man)
    expect(employee.count_observers).to eq(1)
  end

  it 'notify all observers, when change salary' do
    output = "Send Fred a new tax bill!\n"
    output << "Cut a new check for Fred!\n"
    output << "His salary is now 40000!\n"
    employee.add_observer(&tax_man)
    employee.add_observer(&payroll)
    expect { employee.salary = 40000 }.to output(output).to_stdout
  end

  it 'add block observer without variable' do
    output = "Fred is crazy\n"
    employee.add_observer do |changed_employee|
      puts "#{changed_employee.name} is crazy"
    end
    expect { employee.salary = 40000 }.to output(output).to_stdout
  end
end
