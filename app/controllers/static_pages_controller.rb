class StaticPagesController < ApplicationController
  def index
  	@test = Test.new
  	@invested_money = params[:invested_money]
  	cp = CalcProfitability.new
  	@invested_money ||= 0
  	@expect_profit = cp.expect_profit(@invested_money)
  	@expect_history_profit = cp.expect_history_profit(@invested_money)
  end
end
