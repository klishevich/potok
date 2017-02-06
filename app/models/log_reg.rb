class LogReg
  def calc(vFAMILY_MRTL_STATUS_NOT_M, vFAMILY_CHLD_NUM_EQ2, vNB_LOANS_ACTIVE_TOTAL_B, vNB_LOANS_ACTIVE_TOTAL_C, 
  	vnb_TOTAL_INQUIRIES_12_MONTH_B, vnb_TOTAL_INQUIRIES_12_MONTH_C, vGRN_NUM)
  	Rails.logger.info("!!! vFAMILY_MRTL_STATUS_NOT_M #{vFAMILY_MRTL_STATUS_NOT_M}")
  	Rails.logger.info("!!! vFAMILY_CHLD_NUM_EQ2 #{vFAMILY_CHLD_NUM_EQ2}")
  	Rails.logger.info("!!! vNB_LOANS_ACTIVE_TOTAL_B #{vNB_LOANS_ACTIVE_TOTAL_B}")
  	Rails.logger.info("!!! vNB_LOANS_ACTIVE_TOTAL_C #{vNB_LOANS_ACTIVE_TOTAL_C}")
  	Rails.logger.info("!!! vnb_TOTAL_INQUIRIES_12_MONTH_B #{vnb_TOTAL_INQUIRIES_12_MONTH_B}")
  	Rails.logger.info("!!! vnb_TOTAL_INQUIRIES_12_MONTH_C #{vnb_TOTAL_INQUIRIES_12_MONTH_C}")
  	Rails.logger.info("!!! vGRN_NUM #{vGRN_NUM}")
  	cFAMILY_MRTL_STATUS_NOT_M = 0.03780486
  	cFAMILY_CHLD_NUM_EQ2 = 0.29259391
  	cNB_LOANS_ACTIVE_TOTAL_B = 0.41462054
  	cNB_LOANS_ACTIVE_TOTAL_C = 0.71890796
  	cnb_TOTAL_INQUIRIES_12_MONTH_B = 0.66390858
  	cnb_TOTAL_INQUIRIES_12_MONTH_C = 1.27409948
  	cGRN_NUM = -1.36812962
  	cA = -1.80074141
  	z = vFAMILY_MRTL_STATUS_NOT_M*cFAMILY_MRTL_STATUS_NOT_M + vFAMILY_CHLD_NUM_EQ2*cFAMILY_CHLD_NUM_EQ2+
  		vNB_LOANS_ACTIVE_TOTAL_B*cNB_LOANS_ACTIVE_TOTAL_B + vNB_LOANS_ACTIVE_TOTAL_C*cNB_LOANS_ACTIVE_TOTAL_C+
  		vnb_TOTAL_INQUIRIES_12_MONTH_B*cnb_TOTAL_INQUIRIES_12_MONTH_B + vnb_TOTAL_INQUIRIES_12_MONTH_C*cnb_TOTAL_INQUIRIES_12_MONTH_C+
  		cGRN_NUM*vGRN_NUM.to_f + cA
  	Rails.logger.info("!!! z #{z}")
  	e = Math.exp(-z)
  	Rails.logger.info("!!! e #{e}")
  	res = 1 / (1 + e)
  	Rails.logger.info("!!! res #{res}")
  	return res
  end
end 