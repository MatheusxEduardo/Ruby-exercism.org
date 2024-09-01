class SavingsAccount
  def self.interest_rate(balance)
    if balance.negative?
      3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    rate = interest_rate(balance)
    balance + (balance * (rate / 100))
  end

  def self.years_before_desired_balance(initial_balance, desired_balance)
    balance = initial_balance
    years = 0

    while balance < desired_balance
      balance = annual_balance_update(balance)
      years += 1
    end

    years
  end
end
