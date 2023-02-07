view: icd_infographics {
  sql_table_name: "SCH_AHC_UPSON_REGIONAL"."ICD_INFOGRAPHICS" ;;

  dimension: chronic_flag {
    type: number
    sql: ${TABLE}."CHRONIC_FLAG" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."ICD_DESCRIPTION" ;;
  }

  dimension: disease_category {
    type: string
    sql: ${TABLE}."DISEASE_CATEGORY" ;;
  }

  dimension: file_date {
    type: date
    sql: ${TABLE}."FILE_DATE" ;;
  }

  dimension: paid_amount {
    type: number
    sql:${TABLE}."PAID_AMOUNT" ;;
    value_format: "0.00"

  }

  dimension: unique_id {
    type: string
    value_format_name: id
    sql: ${TABLE}."PATIENT_ID_L" ;;
  }

  dimension: reconciled_prin_icd_diag_code {
    type: string
    sql: ${TABLE}."RECONCILED_PRIN_ICD_DIAG_CODE" ;;
  }

  dimension: year_file_date_l {
    type: number
    sql: ${TABLE}."YEAR_FILE_DATE_L" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
