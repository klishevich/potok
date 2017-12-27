class StaticPagesController < ApplicationController

  def test; end
  def test2; end
  def gmaps; end
  
  def index
  	@married = params[:married].to_i
  	@child_num = params[:child_num].to_i
  	@active_loans = params[:active_loans]
  	@inquiries = params[:inquiries]
  	@grn_num = params[:grn_num]
  	Rails.logger.info("married #{@married}")
  	Rails.logger.info("child_num #{@child_num}")
  	Rails.logger.info("active_loans #{@active_loans}")
  	Rails.logger.info("inquiries #{@inquiries}")
  	Rails.logger.info("grn_num #{@grn_num}")
  	vFAMILY_MRTL_STATUS_NOT_M = @married == 0 ? 1 : 0
  	vFAMILY_CHLD_NUM_EQ2 = @child_num >= 2 ? 1 : 0
  	vNB_LOANS_ACTIVE_TOTAL_B = @active_loans == "B" ? 1 : 0
  	vNB_LOANS_ACTIVE_TOTAL_C = @active_loans == "C" ? 1 : 0
  	vnb_TOTAL_INQUIRIES_12_MONTH_B = @inquiries == "B" ? 1: 0
  	vnb_TOTAL_INQUIRIES_12_MONTH_C = @inquiries == "C" ? 1 : 0
  	vGRN_NUM = @grn_num
  	logReg = LogReg.new
  	if @grn_num != nil 
	  	@rating = logReg.calc(vFAMILY_MRTL_STATUS_NOT_M, vFAMILY_CHLD_NUM_EQ2, vNB_LOANS_ACTIVE_TOTAL_B,
	  		vNB_LOANS_ACTIVE_TOTAL_C, vnb_TOTAL_INQUIRIES_12_MONTH_B, vnb_TOTAL_INQUIRIES_12_MONTH_C, vGRN_NUM)	
      @rating_percent = @rating * 100
      @good_rating = -1
      case 
      when @rating < 0.3
        @good_rating = 2
      when @rating < 0.5
        @good_rating = 1
      else
        @good_rating = 0
      end
    end
  end
end
