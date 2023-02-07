view: compliance_summary {
  sql_table_name: "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_COMPLIANCE_SUMMARY"
    ;;

  dimension: unique_id {
    type: string
    hidden: no
    sql: ${TABLE}."UNIQUE_ID" ;;
  }

  dimension: patient_name {
    label: "Patient Name"
    type: string
    hidden: no
    sql: ${TABLE}."PATIENT_NAME" ;;
  }

  dimension: relationship_to_employee {
    type: string
    label: "RELATIONSHIP TO EMPLOYEE"
    sql: ${TABLE}."RELATIONSHIP_TO_EMPLOYEE" ;;
  }

  dimension: member_id{
    type: string
    label: "MEMBER ID"
    sql: ${TABLE}."MEMBER_ID" ;;
  }

  dimension_group: patient_dob {
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
    datatype: date
    label: "Patient DOB"
    sql: ${TABLE}."PATIENT_DOB" ;;
  }

  dimension: PARTICIPANT_FLAG {
    type: string
    label: "PARTICIPANT FLAG"
    sql: ${TABLE}."PARTICIPANT_FLAG" ;;
  }

  dimension: INSURED_FLAG {
    type: string
    label: "INSURED FLAG"
    sql: ${TABLE}."INSURED_FLAG" ;;
  }

  dimension: PARTICIPANT_PROGRAM_NAME{
    type: string
    label: "PARTICIPANT PROGRAM NAME"
    sql: ${TABLE}."PARTICIPANT_PROGRAM_NAME";;
  }

  dimension: Onboard_date {
    type: date
    label: "Onboard date"
    sql: ${TABLE}."ON_BOARD_DATE" ;;
  }

  dimension: PARTICIPANT_YEAR {
    type: string
    label: "PARTICIPANT YEAR"
    sql: ${TABLE}."PARTICIPANT_YEAR" ;;
  }

  dimension: Annual_wellness_visit {
    type: string
    label: "ANNUAL WELLNESS VISIT"
    hidden: no
    sql: ${TABLE}."ANNUAL_WELLNESS_VISIT" ;;
  }

  dimension: Breast_Cancer_Screening {
    type: string
    label: "BREAST CANCER SCREENING"
    sql: ${TABLE}."BREAST_CANCER_SCREENING" ;;
  }

  dimension: Cervical_Cancer_Screening {
    type: string
    label: "CERVICAL CANCER SCREENING"
    sql: ${TABLE}."CERVICAL_CANCER_SCREENING" ;;
  }

  dimension: Colon_Cancer_Screening {
    type: string
    label: "COLON CANCER SCREENING"
    sql: ${TABLE}."COLON_CANCER_SCREENING" ;;
  }

  dimension: Prostate_Exam{
    type: string
    label: "PROSTATE EXAM"
    sql: ${TABLE}."PROSTATE_EXAM" ;;
  }

}
