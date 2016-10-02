class CalcProfitability
  def self.test
  	client = Client.first
  	Rails.logger.info("Test client name #{client.name}")
  end

  def self.expect_history_profit(money_amount)
  	credit = Credit.first
  	amount = credit.amount
  	credit_period_months = credit.credit_period_months
  	main_monthly_payment = amount / credit_period_months
  	# credits = Credit.all
  	# credits.each do |credit|

  	# end
  end

  def self.expect_profit(money_amount)
  	return rate * money_amount
  end

  private
  def rate
  	return 0.3
  end
end