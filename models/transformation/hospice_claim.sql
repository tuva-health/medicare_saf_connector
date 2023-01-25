with hospice_base_claim as (

    select *
         , {{ date_trunc('clm_thru_dt', 'YYYYMMDD', 'year') }} as clm_thru_dt_year
    from {{ var('hospice_base_claim') }}
limit 1000
)

select
      /* Claim ID is not unique across claim types.  Concatenating original claim ID, claim year, and claim type. */
      {{ cast_string_or_varchar('b.claim_no') }}
        || {{ cast_string_or_varchar('b.clm_thru_dt_year') }}
        || {{ cast_string_or_varchar('b.nch_clm_type_cd') }}
      as claim_id
    , cast(l.clm_line_num as integer) as claim_line_number
    , 'institutional' as claim_type
    , {{ cast_string_or_varchar('b.desy_sort_key') }} as patient_id
    , {{ cast_string_or_varchar('NULL') }} as member_id
    -- , {{ try_to_cast_date('b.clm_thru_dt', 'YYYYMMDD') }} as claim_start_date
    -- , cast(substr(b.clm_admsn_dt,0,4) || '-' || substr(b.clm_admsn_dt,5,2) || '-' || substr(b.clm_admsn_dt,7,2) as date) as claim_start_date
    , null as claim_start_date
    -- , {{ try_to_cast_date('b.clm_thru_dt', 'YYYYMMDD') }} as claim_end_date
    , cast(substr(b.clm_thru_dt,0,4) || '-' || substr(b.clm_thru_dt,5,2) || '-' || substr(b.clm_thru_dt,7,2) as date) as claim_end_date
    , {{ try_to_cast_date('l.clm_thru_dt', 'YYYYMMDD') }} as claim_line_start_date
    , {{ try_to_cast_date('l.clm_thru_dt', 'YYYYMMDD') }} as claim_line_end_date
    -- , {{ try_to_cast_date('b.clm_hospc_start_dt_id', 'YYYYMMDD') }} as admission_date
    -- , cast(substr(b.clm_admsn_dt,0,4) || '-' || substr(b.clm_admsn_dt,5,2) || '-' || substr(b.clm_admsn_dt,7,2) as date) as admission_date
    , null as admission_date
    -- , {{ try_to_cast_date('b.nch_bene_dschrg_dt', 'YYYYMMDD') }} as discharge_date
    , cast(substr(b.nch_bene_dschrg_dt,0,4) || '-' || substr(b.nch_bene_dschrg_dt,5,2) || '-' || substr(b.nch_bene_dschrg_dt,7,2) as date) as discharge_date
    , {{ cast_string_or_varchar('NULL') }} as admit_source_code
    , {{ cast_string_or_varchar('NULL') }} as admit_type_code
    , {{ cast_string_or_varchar('NULL') }} as discharge_disposition_code
    , {{ cast_string_or_varchar('NULL') }} as place_of_service_code
    , {{ cast_string_or_varchar('b.clm_fac_type_cd') }}
        || {{ cast_string_or_varchar('b.clm_srvc_clsfctn_type_cd') }}
        || {{ cast_string_or_varchar('b.clm_freq_cd') }}
      as bill_type_code
    , {{ cast_string_or_varchar('NULL') }} as ms_drg_code
    , {{ cast_string_or_varchar('l.rev_cntr') }} as revenue_center_code
    , cast(regexp_substr(l.rev_cntr_unit_cnt, '.') as integer) as service_unit_quantity
    , {{ cast_string_or_varchar('l.hcpcs_cd') }} as hcpcs_code
    , {{ cast_string_or_varchar('l.hcpcs_1st_mdfr_cd') }} as hcpcs_modifier_1
    , {{ cast_string_or_varchar('l.hcpcs_2nd_mdfr_cd') }} as hcpcs_modifier_2
    , {{ cast_string_or_varchar('l.hcpcs_3rd_mdfr_cd') }} as hcpcs_modifier_3
    , {{ cast_string_or_varchar('NULL') }} as hcpcs_modifier_4
    , {{ cast_string_or_varchar('NULL') }} as hcpcs_modifier_5
    , {{ cast_string_or_varchar('l.rev_cntr_rndrng_physn_npi') }} as rendering_npi
    , {{ cast_string_or_varchar('NULL') }} as billing_npi
    , {{ cast_string_or_varchar('b.org_npi_num') }} as facility_npi
    , date(NULL) as paid_date
    , {{ cast_numeric('l.rev_cntr_pmt_amt_amt') }} as paid_amount
    , {{ cast_numeric('NULL') }} as allowed_amount
    , {{ cast_numeric('l.rev_cntr_tot_chrg_amt') }} as charge_amount
    , 'icd-10-cm' as diagnosis_code_type
    , {{ cast_string_or_varchar('b.prncpal_dgns_cd') }} as diagnosis_code_1
    , {{ cast_string_or_varchar('b.icd_dgns_cd2') }} as diagnosis_code_2
    , {{ cast_string_or_varchar('b.icd_dgns_cd3') }} as diagnosis_code_3
    , {{ cast_string_or_varchar('b.icd_dgns_cd4') }} as diagnosis_code_4
    , {{ cast_string_or_varchar('b.icd_dgns_cd5') }} as diagnosis_code_5
    , {{ cast_string_or_varchar('b.icd_dgns_cd6') }} as diagnosis_code_6
    , {{ cast_string_or_varchar('b.icd_dgns_cd7') }} as diagnosis_code_7
    , {{ cast_string_or_varchar('b.icd_dgns_cd8') }} as diagnosis_code_8
    , {{ cast_string_or_varchar('b.icd_dgns_cd9') }} as diagnosis_code_9
    , {{ cast_string_or_varchar('b.icd_dgns_cd10') }} as diagnosis_code_10
    , {{ cast_string_or_varchar('b.icd_dgns_cd11') }} as diagnosis_code_11
    , {{ cast_string_or_varchar('b.icd_dgns_cd12') }} as diagnosis_code_12
    , {{ cast_string_or_varchar('b.icd_dgns_cd13') }} as diagnosis_code_13
    , {{ cast_string_or_varchar('b.icd_dgns_cd14') }} as diagnosis_code_14
    , {{ cast_string_or_varchar('b.icd_dgns_cd15') }} as diagnosis_code_15
    , {{ cast_string_or_varchar('b.icd_dgns_cd16') }} as diagnosis_code_16
    , {{ cast_string_or_varchar('b.icd_dgns_cd17') }} as diagnosis_code_17
    , {{ cast_string_or_varchar('b.icd_dgns_cd18') }} as diagnosis_code_18
    , {{ cast_string_or_varchar('b.icd_dgns_cd19') }} as diagnosis_code_19
    , {{ cast_string_or_varchar('b.icd_dgns_cd20') }} as diagnosis_code_20
    , {{ cast_string_or_varchar('b.icd_dgns_cd21') }} as diagnosis_code_21
    , {{ cast_string_or_varchar('b.icd_dgns_cd22') }} as diagnosis_code_22
    , {{ cast_string_or_varchar('b.icd_dgns_cd23') }} as diagnosis_code_23
    , {{ cast_string_or_varchar('b.icd_dgns_cd24') }} as diagnosis_code_24
    , {{ cast_string_or_varchar('b.icd_dgns_cd25') }} as diagnosis_code_25
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_1
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_2
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_3
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_4
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_5
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_6
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_7
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_8
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_9
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_10
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_11
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_12
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_13
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_14
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_15
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_16
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_17
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_18
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_19
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_20
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_21
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_22
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_23
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_24
    , {{ cast_string_or_varchar('NULL') }} as diagnosis_poa_25
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_type
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_1
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_2
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_3
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_4
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_5
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_6
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_7
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_8
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_9
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_10
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_11
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_12
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_13
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_14
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_15
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_16
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_17
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_18
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_19
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_20
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_21
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_22
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_23
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_24
    , {{ cast_string_or_varchar('NULL') }} as procedure_code_25
    , date(NULL) as procedure_date_1
    , date(NULL) as procedure_date_2
    , date(NULL) as procedure_date_3
    , date(NULL) as procedure_date_4
    , date(NULL) as procedure_date_5
    , date(NULL) as procedure_date_6
    , date(NULL) as procedure_date_7
    , date(NULL) as procedure_date_8
    , date(NULL) as procedure_date_9
    , date(NULL) as procedure_date_10
    , date(NULL) as procedure_date_11
    , date(NULL) as procedure_date_12
    , date(NULL) as procedure_date_13
    , date(NULL) as procedure_date_14
    , date(NULL) as procedure_date_15
    , date(NULL) as procedure_date_16
    , date(NULL) as procedure_date_17
    , date(NULL) as procedure_date_18
    , date(NULL) as procedure_date_19
    , date(NULL) as procedure_date_20
    , date(NULL) as procedure_date_21
    , date(NULL) as procedure_date_22
    , date(NULL) as procedure_date_23
    , date(NULL) as procedure_date_24
    , date(NULL) as procedure_date_25
    , 'saf' as data_source
from hospice_base_claim as b
inner join {{ var('hospice_revenue_center') }} as l
    on b.claim_no = l.claim_no
limit 1000
