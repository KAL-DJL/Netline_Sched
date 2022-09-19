select
	to_char(local_time_base_std_date, 'YYYY-MM-DD') as DEP_Date,
	operating_carrier_iata_carr_cd as OP_CARR,
	departure_apo_iata_cty_apo_cd as DEP_APO,
	arrival_apo_iata_cty_apo_cd as ARR_APO,
	operating_carrier_flt_sub_num as OP_FLT_NUM,
	marketing_carrier_cbn_cls_cd as CBN_CLS,
	marketing_carrier_bok_cls_cd as BKG_CLS,	
	sum(NETT_KRW_AMOUNT) as REV_Incl_FSC,
	sum(VALID_REV_TRFC_DOC_CPN_SL_CNT) as PAX_CNT ,
	sum(NETT_KRW_AMOUNT)/ nullif (sum(VALID_REV_TRFC_DOC_CPN_SL_CNT),
	0) as Average_AR
from
	PSSBI.yy_tfac_cnfm_iss_intl_cpn
where
	local_time_base_std_date between '2022-09-26' and '2022-09-27'
	and operating_carrier_iata_carr_cd ='KE'
	and operating_carrier_flt_sub_num <> '~'
group by
	local_time_base_std_date,	
	Departure_apo_iata_cty_apo_cd,
	arrival_apo_iata_cty_apo_cd,
	marketing_carrier_cbn_cls_cd ,
	marketing_carrier_bok_cls_cd ,
	operating_carrier_flt_sub_num ,
	operating_carrier_iata_carr_cd
order by
    local_time_base_std_date,	
    departure_apo_iata_cty_apo_cd ,
	arrival_apo_iata_cty_apo_cd,
    operating_carrier_flt_sub_num ,
    marketing_carrier_cbn_cls_cd ,
    marketing_carrier_bok_cls_cd 
