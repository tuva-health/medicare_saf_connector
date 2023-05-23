select desy_sort_key,
       claim_no,
       prvdr_num,
       clm_thru_dt,
       nch_near_line_rec_ident_cd,
       nch_clm_type_cd,
       claim_query_code,
       clm_fac_type_cd,
       clm_srvc_clsfctn_type_cd,
       clm_freq_cd,
       fi_num,
       clm_mdcr_non_pmt_rsn_cd,
       clm_pmt_amt,
       nch_prmry_pyr_clm_pd_amt,
       nch_prmry_pyr_cd,
       prvdr_state_cd,
       org_npi_num,
       srvc_loc_npi_num,
       at_physn_upin,
       at_physn_npi,
       at_physn_spclty_cd,
       op_physn_upin,
       op_physn_npi,
       op_physn_spclty_cd,
       ot_physn_upin,
       ot_physn_npi,
       ot_physn_spclty_cd,
       rndrng_physn_npi,
       rndrng_physn_spclty_cd,
       rfr_physn_npi,
       rfr_physn_spclty_cd,
       clm_mco_pd_sw,
       ptnt_dschrg_stus_cd,
       clm_tot_chrg_amt,
       nch_bene_blood_ddctbl_lblty_am,
       nch_profnl_cmpnt_chrg_amt,
       prncpal_dgns_cd,
       icd_dgns_cd1,
       icd_dgns_cd2,
       icd_dgns_cd3,
       icd_dgns_cd4,
       icd_dgns_cd5,
       icd_dgns_cd6,
       icd_dgns_cd7,
       icd_dgns_cd8,
       icd_dgns_cd9,
       icd_dgns_cd10,
       icd_dgns_cd11,
       icd_dgns_cd12,
       icd_dgns_cd13,
       icd_dgns_cd14,
       icd_dgns_cd15,
       icd_dgns_cd16,
       icd_dgns_cd17,
       icd_dgns_cd18,
       icd_dgns_cd19,
       icd_dgns_cd20,
       icd_dgns_cd21,
       icd_dgns_cd22,
       icd_dgns_cd23,
       icd_dgns_cd24,
       icd_dgns_cd25,
       fst_dgns_e_cd,
       icd_dgns_e_cd1,
       icd_dgns_e_cd2,
       icd_dgns_e_cd3,
       icd_dgns_e_cd4,
       icd_dgns_e_cd5,
       icd_dgns_e_cd6,
       icd_dgns_e_cd7,
       icd_dgns_e_cd8,
       icd_dgns_e_cd9,
       icd_dgns_e_cd10,
       icd_dgns_e_cd11,
       icd_dgns_e_cd12,
       icd_prcdr_cd1,
       prcdr_dt1,
       icd_prcdr_cd2,
       prcdr_dt2,
       icd_prcdr_cd3,
       prcdr_dt3,
       icd_prcdr_cd4,
       prcdr_dt4,
       icd_prcdr_cd5,
       prcdr_dt5,
       icd_prcdr_cd6,
       prcdr_dt6,
       icd_prcdr_cd7,
       prcdr_dt7,
       icd_prcdr_cd8,
       prcdr_dt8,
       icd_prcdr_cd9,
       prcdr_dt9,
       icd_prcdr_cd10,
       prcdr_dt10,
       icd_prcdr_cd11,
       prcdr_dt11,
       icd_prcdr_cd12,
       prcdr_dt12,
       icd_prcdr_cd13,
       prcdr_dt13,
       icd_prcdr_cd14,
       prcdr_dt14,
       icd_prcdr_cd15,
       prcdr_dt15,
       icd_prcdr_cd16,
       prcdr_dt16,
       icd_prcdr_cd17,
       prcdr_dt17,
       icd_prcdr_cd18,
       prcdr_dt18,
       icd_prcdr_cd19,
       prcdr_dt19,
       icd_prcdr_cd20,
       prcdr_dt20,
       icd_prcdr_cd21,
       prcdr_dt21,
       icd_prcdr_cd22,
       prcdr_dt22,
       icd_prcdr_cd23,
       prcdr_dt23,
       icd_prcdr_cd24,
       prcdr_dt24,
       icd_prcdr_cd25,
       prcdr_dt25,
       rsn_visit_cd1,
       rsn_visit_cd2,
       rsn_visit_cd3,
       nch_bene_ptb_ddctbl_amt,
       nch_bene_ptb_coinsrnc_amt,
       clm_op_prvdr_pmt_amt,
       clm_op_bene_pmt_amt,
       dob_dt,
       gndr_cd,
       bene_race_cd,
       bene_cnty_cd,
       bene_state_cd,
       cwf_bene_mdcr_stus_cd,
       fi_clm_actn_cd,
       nch_blood_pnts_frnshd_qty,
       clm_trtmt_authrztn_num,
       clm_prcr_rtrn_cd,
       clm_op_trans_type_cd,
       clm_op_esrd_mthd_cd,
       clm_next_gnrtn_aco_ind_cd1,
       clm_next_gnrtn_aco_ind_cd2,
       clm_next_gnrtn_aco_ind_cd3,
       clm_next_gnrtn_aco_ind_cd4,
       clm_next_gnrtn_aco_ind_cd5,
       aco_id_num,
       'lds' as data_source
from
medicare_lds_five_percent.raw_data.outpatient_base_claim