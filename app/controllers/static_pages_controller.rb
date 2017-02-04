class StaticPagesController < ApplicationController
  def index
  	@test = Test.new
  	@NB_LOANS_ACTIVE_TOTAL = params[:NB_LOANS_ACTIVE_TOTAL].to_i
  	@GRN_NUM = params[:GRN_NUM].to_i
  	@NB_LOANS_ACTIVE_TOTAL0 = params[:NB_LOANS_ACTIVE_TOTAL0].to_i
  	@TOTAL_INQUIRIES_12_MONTH1 = params[:TOTAL_INQUIRIES_12_MONTH1].to_i
  	@REG_CODE = params[:REG_CODE]
  	@FAMILY_CHLD_NUM = params[:FAMILY_CHLD_NUM]
  	@WORK_SHARE_BUSINESS = params[:WORK_SHARE_BUSINESS]
  	@res = -1
  	if @NB_LOANS_ACTIVE_TOTAL
  		@res = 0
	  	@res = @NB_LOANS_ACTIVE_TOTAL< 4.5 ? @res + 1: @res
	  	@res = @GRN_NUM<1 ? @res + 1 : @res
	  	@res = @NB_LOANS_ACTIVE_TOTAL0 < 4.5 ? @res + 1: @res
	  	@res = @TOTAL_INQUIRIES_12_MONTH1 < 4.5 ? @res + 1: @res
	  	if @REG_CODE == '34' || @REG_CODE == '56' || @REG_CODE == '38' || @REG_CODE == '42' || @REG_CODE == '61' || @REG_CODE == '55' 
	  		@res = @res
	  	else
	  		@res = @res + 0.5
		  	@res = @WORK_SHARE_BUSINESS != '100'? @res + 0.5 : @res
		end
	end
# 6  1  4  NULL  D  24.00000000  9  78  100.00

  	@NB_LOANS_ACTIVE_TOTAL ||= 6
  	@GRN_NUM ||=1
  	@NB_LOANS_ACTIVE_TOTAL0 ||= 4
  	@TOTAL_INQUIRIES_12_MONTH1 ||= 2
  	@REG_CODE ||= '52'
  	# @FAMILY_CHLD_NUM ||= ''
  	@WORK_SHARE_BUSINESS ||= 100
  	Rails.logger.info("GRN_NUM #{@GRN_NUM}")
  	Rails.logger.info("FAMILY_CHLD_NUM #{@FAMILY_CHLD_NUM}")
  	# cp = CalcProfitability.new
  	# @invested_money ||= 0
  	# @expect_profit = cp.expect_profit(@invested_money)
  	# @expect_history_profit = cp.expect_history_profit(@invested_money)
  end
end
