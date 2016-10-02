class CalcProfitability
  # attr_accessor :subdomain, :pass, :account, 
  #   :products, :seofilters, :products_links, :page_num, :days_upd_since, :product_field_id_seo
  
  # def initialize(invested_money)
  #    @subdomain = subdomain
  # end

  # def calc
  # end

  # def test
  # 	client = Client.first
  # 	Rails.logger.info("Test client name #{client.name}")
  # end

  def expect_history_profit(money_amount = 1)
    credits = Credit.all
    total_percent_payed = 0
    total_debt_payed = 0
    credits.each do |credit|
      res = calc_credit(credit)
      total_percent_payed += res['percent_payed']
      total_debt_payed += res['debt_payed']
    end
    expect_profit = money_amount.to_f * total_percent_payed / total_debt_payed * coef
    return expect_profit.truncate(2).to_s('F')
  end

  def expect_profit(money_amount = 1)
  	return money_amount.to_f * rate / 100
  end

  def calc_credit(credit)
    debt_left = credit.amount
    percent_payed = 0
    credit.credit_payments.each do |p|
      if p.is_fine
        res = calc_payment(debt_left, credit.fine_rate, credit.amount, p.amount)
        percent_payed += res['percent_payed']
        debt_left = res['debt_left']
      else
        res = calc_payment(debt_left, credit.rate, credit.amount, p.amount)
        percent_payed += res['percent_payed']
        debt_left = res['debt_left']
      end
      Rails.logger.info("#{p.month}) debt_left #{debt_left}, percent_payed #{percent_payed}")
    end
    res = Hash.new
    res['percent_payed'] = percent_payed
    res['debt_payed'] = debt_left <= 0 ? credit.amount : credit.amount - debt_left
    return res
  end

  private

  def calc_payment(debt_amount, rate, amount_for_rate, payment)
    percent_payment = amount_for_rate.to_f * rate / 12 / 100
    # Rails.logger.info("percent_payment #{percent_payment}")
    res = Hash.new
    if debt_amount <= 0 
      res['percent_payed'] = 0
      # res['main_payed'] = 0
      res['debt_left'] = debt_amount - payment
    else
      if (payment <= percent_payment)
        res['percent_payed'] = payment
        res['debt_left'] = debt_amount
      elsif (percent_payment < payment)
        res['percent_payed'] = percent_payment
        res['debt_left'] = debt_amount - (payment - percent_payment)
      end
    end
    return res
  end

  def rate
  	return 30
  end

  def coef
    return 12 / 6
  end

  # def fine_rate
  #   return 0.3
  # end
end