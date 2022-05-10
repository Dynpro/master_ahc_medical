view: ebr_measures {
  derived_table: {
    sql: select * from "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_EBR_MEASURES"
      WHERE "UNIQUE_ID" IN (select DISTINCT "UNIQUE_ID" from "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_MEDICAL"
        WHERE {% condition PARTICIPANT_YEAR %} LEFT("PAID_DATE", 4) {% endcondition %} AND
        {% condition PARTICIPANT_Flag %} "PARTICIPANT_FLAG" {% endcondition %})
    ;;
  }


  dimension: individual_had_emergency_room_and_inpatient_visit {
    type: string
    label: "ER & Inpatient Visit"
    description: "INDIVIDUAL HAD EMERGENCY ROOM & SUBSEQUENT INPATIENT VISIT"
    sql: ${TABLE}."INDIVIDUAL_HAD_EMERGENCY_ROOM_AND_INPATIENT_VISIT" ;;
  }

  measure: individual_had_emergency_room_and_inpatient_visit_patients {
    type: count_distinct
    filters: [individual_had_emergency_room_and_inpatient_visit: "1"]
    label: "ER & Inpatient Visit - N"
    description: "INDIVIDUAL HAD EMERGENCY ROOM & SUBSEQUENT INPATIENT VISIT"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group {
    type: string
    hidden: yes
    sql: ${TABLE}."INDIVIDUAL_IS_IN_DISEASE_GROUP" ;;
  }

  dimension: individual_is_in_disease_group_one {
    type: string
    label: "Disease Grp-1 (NO CHRONIC DISEASE AND LESS THAN $1500 MEDICAL EXPENDITURES PER 12 MONTHS)"
    description: "NO CHRONIC DISEASE AND LESS THAN $1500 MEDICAL EXPENDITURES PER 12 MONTHS"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-1' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_one_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_one: "1"]
    label: "Disease Grp1 - N (NO CHRONIC DISEASE AND LESS THAN $1500 MEDICAL EXPENDITURES PER 12 MONTHS)"
    description: "NO CHRONIC DISEASE AND LESS THAN $1500 MEDICAL EXPENDITURES PER 12 MONTHS"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group_two {
    type: string
    label: "Disease Grp-2 (NO CHRONIC DISEASE AND $1500 OR MORE MEDICAL EXPENDITURES PER 12 MONTHS)"
    description: "NO CHRONIC DISEASE AND $1500 OR MORE MEDICAL EXPENDITURES PER 12 MONTHS"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-2' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_two_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_two: "1"]
    label: "Disease Grp2 - N (NO CHRONIC DISEASE AND $1500 OR MORE MEDICAL EXPENDITURES PER 12 MONTHS)"
    description: "NO CHRONIC DISEASE AND $1500 OR MORE MEDICAL EXPENDITURES PER 12 MONTHS"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group_three {
    type: string
    label: "Disease Grp-3 (ONE CHRONIC DISEASE)"
    description: "ONE CHRONIC DISEASE"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-3' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_three_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_three: "1"]
    label: "Disease Grp3 - N (ONE CHRONIC DISEASE)"
    description: "ONE CHRONIC DISEASE"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group_four {
    type: string
    label: "Disease Grp-4 (TWO CHRONIC DISEASE)"
    description: "TWO CHRONIC DISEASE"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-4' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_four_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_four: "1"]
    label: "Disease Grp4 - N (TWO CHRONIC DISEASE)"
    description: "TWO CHRONIC DISEASE"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group_five {
    type: string
    label: "Disease Grp-5 (THREE CHRONIC DISEASE)"
    description: "THREE CHRONIC DISEASE"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-5' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_five_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_five: "1"]
    label: "Disease Grp5 - N (THREE CHRONIC DISEASE)"
    description: "THREE CHRONIC DISEASE"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group_six {
    type: string
    label: "Disease Grp-6 (FOUR CHRONIC DISEASE)"
    description: "FOUR CHRONIC DISEASE"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-6' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_six_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_six: "1"]
    label: "Disease Grp6 - N (FOUR CHRONIC DISEASE)"
    description: "FOUR CHRONIC DISEASE"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group_seven {
    type: string
    label: "Disease Grp-7 (FIVE OR MORE CHRONIC DISEASES)"
    description: "FIVE OR MORE CHRONIC DISEASES"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-7' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_seven_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_seven: "1"]
    label: "Disease Grp7 - N (FIVE OR MORE CHRONIC DISEASES)"
    description: "FIVE OR MORE CHRONIC DISEASES"
    sql: ${unique_id} ;;
  }

  dimension: individual_had_primary_care_physician_visit {
    type: string
    label: "Primary Care visit"
    description: "INDIVIDUAL HAD PRIMARY CARE PHYSICIAN VISIT"
    sql: ${TABLE}."INDIVIDUAL_HAD_PRIMARY_CARE_PHYSICIAN_VISIT" ;;
  }

  measure: individual_had_primary_care_physician_visit_patients {
    type: count_distinct
    filters: [individual_had_primary_care_physician_visit: "1"]
    label: "Primary Care visit - N"
    description: "INDIVIDUAL HAD PRIMARY CARE PHYSICIAN VISIT"
    sql: ${unique_id} ;;
  }

  dimension: individual_female_had_breast_cancer_screening {
    type: string
    label: "Breast Cancer Screening"
    description: "INDIVIDUAL FEMALE HAD BREAST CANCER SCREENING"
    sql: ${TABLE}."INDIVIDUAL_FEMALE_HAD_BREAST_CANCER_SCREENING" ;;
  }

  measure: individual_female_had_breast_cancer_screening_patients {
    type: count_distinct
    filters: [individual_female_had_breast_cancer_screening: "1"]
    label: "Breast Cancer Screening - N"
    description: "INDIVIDUAL FEMALE HAD BREAST CANCER SCREENING"
    sql: ${unique_id} ;;
  }

  dimension: individual_female_had_colon_cancer_screening {
    type: string
    label: "Colon Cancer Screening"
    description: "INDIVIDUAL FEMALE HAD COLON CANCER SCREENING"
    sql: ${TABLE}."INDIVIDUAL_FEMALE_HAD_COLON_CANCER_SCREENING" ;;
  }

  measure: individual_female_had_colon_cancer_screening_patients {
    type: count_distinct
    filters: [individual_female_had_colon_cancer_screening: "1"]
    label: "Colon Cancer Screening - N"
    description: "INDIVIDUAL FEMALE HAD COLON CANCER SCREENING"
    sql: ${unique_id} ;;
  }

  dimension: individual_female_had_cervical_cancer_screening {
    type: string
    label: "Cervical Cancer Screening"
    description: "INDIVIDUAL FEMALE HAD CERVICAL CANCER SCREENING"
    sql: ${TABLE}."INDIVIDUAL_FEMALE_HAD_CERVICAL_CANCER_SCREENING" ;;
  }

  measure: individual_female_had_cervical_cancer_screening_patients {
    type: count_distinct
    filters: [individual_female_had_cervical_cancer_screening: "1"]
    label: "Cervical Cancer Screening - N"
    description: "INDIVIDUAL FEMALE HAD CERVICAL CANCER SCREENING"
    sql: ${unique_id} ;;
  }

  dimension: individual_has_diabetes_diagnosis_and_screened_for_retinopathy {
    type: string
    label: "Diabetes & RETINOPATHY Screening"
    description: "INDIVIDUAL HAS DIABETES DIAGNOSIS AND SCREENED FOR RETINOPATHY"
    sql: ${TABLE}."INDIVIDUAL_HAS_DIABETES_DIAGNOSIS_AND_SCREENED_FOR_RETINOPATHY" ;;
  }

  measure: individual_has_diabetes_diagnosis_and_screened_for_retinopathy_patients {
    type: count_distinct
    filters: [individual_has_diabetes_diagnosis_and_screened_for_retinopathy: "1"]
    label: "Diabetes & RETINOPATHY Screening - N"
    description: "INDIVIDUAL HAS DIABETES DIAGNOSIS AND SCREENED FOR RETINOPATHY"
    sql: ${unique_id} ;;
  }

  dimension: unique_id {
    type: string
    label: "Patient ID"
    sql: ${TABLE}."UNIQUE_ID" ;;
  }

  dimension: year {
    type: number
    label: "Year"
    sql: ${TABLE}."YEAR" ;;
    value_format: "0"
  }

  measure: total_patients {
    type: count_distinct
    label: "N"
    sql: ${unique_id} ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
  filter: PARTICIPANT_YEAR {
    type: string
    group_label: "PARTICIPANT FILTER"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.participant_paid_year
  }

  filter: PARTICIPANT_Flag {
    type: string
    group_label: "PARTICIPANT FILTER"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.PARTICIPANT_NONPARTICIPANT_Flag
  }

  dimension: HOSPITALIZED_OR_NOT {
    type: string
    label: "HOSPITALIZED OR NOT"
    sql:  ${TABLE}."HOSPITALIZED_OR_NOT" ;;
  }

  dimension: Inpatient_Hospitalization {
    type: string
    label: "Inpatient Hospitalization"
    sql:  case when ${HOSPITALIZED_OR_NOT} = 'YES' then '1'
          else '0'
          end;;
  }

}
