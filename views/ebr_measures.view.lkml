view: ebr_measures {
  sql_table_name: "SCH_AHC_UPSON_REGIONAL"."EBR_MEASURES"
    ;;


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

  dimension: individual_is_in_disease_group_three {
    type: string
    label: "Disease Grp-3"
    description: "INDIVIDUAL IS IN DISEASE GROUP-3"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-3' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_three_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_three: "1"]
    label: "Disease Grp3 - N"
    description: "INDIVIDUAL IS IN DISEASE GROUP3"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group_four {
    type: string
    label: "Disease Grp-4"
    description: "INDIVIDUAL IS IN DISEASE GROUP-4"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-4' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_four_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_four: "1"]
    label: "Disease Grp4 - N"
    description: "INDIVIDUAL IS IN DISEASE GROUP4"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group_five {
    type: string
    label: "Disease Grp-5"
    description: "INDIVIDUAL IS IN DISEASE GROUP-5"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-5' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_five_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_five: "1"]
    label: "Disease Grp5 - N"
    description: "INDIVIDUAL IS IN DISEASE GROUP5"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group_six {
    type: string
    label: "Disease Grp-6"
    description: "INDIVIDUAL IS IN DISEASE GROUP-6"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-6' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_six_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_six: "1"]
    label: "Disease Grp6 - N"
    description: "INDIVIDUAL IS IN DISEASE GROUP6"
    sql: ${unique_id} ;;
  }

  dimension: individual_is_in_disease_group_seven {
    type: string
    label: "Disease Grp-7"
    description: "INDIVIDUAL IS IN DISEASE GROUP-7"
    sql: CASE WHEN ${individual_is_in_disease_group} = 'GROUP-7' THEN '1'
      ELSE '0'
      END ;;
  }

  measure: individual_is_in_disease_group_seven_patients {
    type: count_distinct
    filters: [individual_is_in_disease_group_seven: "1"]
    label: "Disease Grp7 - N"
    description: "INDIVIDUAL IS IN DISEASE GROUP7"
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

  dimension: PARTICIPANT_Flag {
    type: string
    sql: ${TABLE}."PARTICIPANT_FLAG" ;;
  }
}
