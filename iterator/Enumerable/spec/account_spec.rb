require_relative '../account'

describe Account do
  let(:account1) { Account.new("Credit", 30_000) }
  let(:account2) { Account.new("Credit", 25_000) }

  it "has method name" do
    expect(account1.respond_to?(:name)).to be true
  end

  it "has method name=" do
    expect(account1.respond_to?(:name=)).to be true
  end

  it "has method balance" do
    expect(account1.respond_to?(:balance)).to be true
  end

  it "has method balance=" do
    expect(account1.respond_to?(:balance=)).to be true
  end

  it "has method <=>" do
    expect(account1.respond_to?(:<=>)).to be true
  end

  it "account1 > account2" do
    expect(account1 <=> account2).to eq(1)
  end

  it "account1 < account2" do
    account1.balance = 10
    expect(account1 <=> account2).to eq(-1)
  end

  it "account1 == account2" do
    account1.balance = account2.balance
    expect(account1 <=> account2).to eq(0)
  end
end
