require_relative '../account'
require_relative '../portfolio'

describe Portfolio do
  let(:account1) { Account.new("Credit", 30_000) }
  let(:account2) { Account.new("Debit", 25_000) }
  let(:account3) { Account.new("Credit", 15_000) }
  let(:portfolio) { Portfolio.new }

  it "has method each" do
    expect(portfolio).to respond_to(:each)
  end

  it "has method add_account" do
    expect(portfolio).to respond_to(:add_account)
  end

  it "method add_account add new account to array" do
    expect { portfolio.add_account(account1) }
      .to change { portfolio.count }.by(1)
  end

  it "iterate via each" do
    result = ""
    result << "Credit: 30000\n"
    result << "Debit: 25000\n"
    result << "Credit: 15000\n"
    portfolio.add_account(account1)
    portfolio.add_account(account2)
    portfolio.add_account(account3)
    expect do
      portfolio.each do |account|
        puts "#{account.name}: #{account.balance}"
      end
    end.to output(result).to_stdout
  end

  it "has method map" do
    portfolio.add_account(account1)
    portfolio.add_account(account2)
    expect(portfolio.map(&:name)).to eq(%w(Credit Debit))
  end

  it "has method select" do
    portfolio.add_account(account1)
    portfolio.add_account(account2)
    portfolio.add_account(account3)
    expect(portfolio.select { |acc| acc.balance < 26_000 })
      .to eq([account2, account3])
  end
end
