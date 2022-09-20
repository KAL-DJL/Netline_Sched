select
	local_time_base_std_datev as DEP_Date,
	iata_carrier_code as OP_CARR,
	leg_dep_apo_iata_cty_apo_cd as DEP_APO,
	leg_arv_apo_iata_cty_apo_cd as ARR_APO,
	flight_sub_suffix_number as OP_FLT_NUM, 
	cabin_class_code as CBN_CLS,
	booking_class_code as BKG_CLS,
	iata_aircraft_type_code as AC_Type,
	cstr_dmnd_su_apct_value as PAX_CNT, 	
	ttl_bkg_pax_cnt as BKG_CNT, 
	capture_datev as Cap_Date
from  ext_general_pss_rms.xxpss_rms_flight_leg_bkgcls
WHERE local_time_base_std_datev BETWEEN '20220926' AND '20220930' /*between current_date and current_date+90*/
     AND capture_datev = '20220918' /*Today로 변환 필요*/
     and iata_carrier_code = 'KE'
