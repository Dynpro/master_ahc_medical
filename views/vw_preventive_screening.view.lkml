view: vw_preventive_screening {
  derived_table: {
    sql: select * from "SCH_AHC_UPSON_REGIONAL"."VW_PREVENTIVE_SCREENING"
      WHERE "UNIQUE_ID" IN (select DISTINCT "UNIQUE_ID" from "SCH_AHC_DESOTO_MEMORIAL"."VW_MEDICAL"
        WHERE {% condition PARTICIPANT_YEAR %} LEFT("PAID_DATE", 4) {% endcondition %} AND
        {% condition PARTICIPANT_Flag %} "PARTICIPANT_FLAG" {% endcondition %})
      ;;
  }

  dimension: cancer_diagnosis {
    type: string
    label: "Cancer Diagnosis"
    sql: ${TABLE}."CANCER_DIAGNOSIS" ;;
  }

  dimension: cancer_screening {
    type: string
    label: "Cancer Screening"
    sql: ${TABLE}."CANCER_SCREENING" ;;
  }

  dimension_group: diagnosis_date_max {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    label: "DIAGNOSIS DATE"
    datatype: date
    sql: ${TABLE}."DIAGNOSIS_DATE_MAX" ;;
  }

  dimension_group: screening_date_min {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    label: "SCREENING DATE"
    datatype: date
    sql: ${TABLE}."SCREENING_DATE_MIN" ;;
  }

  dimension: unique_id {
    type: string
    hidden: yes
    sql: ${TABLE}."UNIQUE_ID" ;;
  }

  dimension: year {
    type: string
    label: "DIAGNOSIS YEAR"
    sql: ${TABLE}."YEAR" ;;
  }

  measure: Total_Patients {
    type: count_distinct
    label: "N"
    sql: ${unique_id} ;;
  }

  measure: Total_Breast_Cancer_Diagnosis {
    type: count_distinct
    label: "Breast Cancer Diagnosis - N"
    filters: [cancer_diagnosis: "BREAST CANCER"]
    sql: ${unique_id} ;;
  }

  measure: Total_Cervical_Cancer_Diagnosis {
    type: count_distinct
    label: "Cervical Cancer Diagnosis - N"
    filters: [cancer_diagnosis: "CERVICAL CANCER"]
    sql: ${unique_id} ;;
  }

  measure: Total_Colon_Cancer_Diagnosis {
    type: count_distinct
    label: "Colon Cancer Diagnosis - N"
    filters: [cancer_diagnosis: "COLON CANCER"]
    sql: ${unique_id} ;;
  }



  dimension: PATIENT_GENDER {
    type: string
    label: "PATIENT GENDER"
    sql: ${TABLE}."PATIENT_GENDER" ;;
  }

  dimension: patient_age {
    type: number
    label: "PATIENT AGE"
    sql: ${TABLE}."PATIENT_AGE" ;;
  }

  dimension: ageGroup {
    type: tier
    label: "AGE GROUP"
    tiers: [20, 30, 40, 50, 60]
    description: "AGE Group>> 0-19, 20-29, 30-39, 40-49, 50-59 & >=60 yrs"
    style: integer
    sql:  ${patient_age};;
  }
  dimension: relationship_to_employee {
    type: string
    label: "RELATIONSHIP TO EMPLOYEE"
    sql: ${TABLE}."RELATIONSHIP_TO_EMPLOYEE" ;;
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
}
