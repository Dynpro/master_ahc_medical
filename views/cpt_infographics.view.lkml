view: cpt_infographics {
  sql_table_name: "SCH_AHC_UPSON_REGIONAL"."CPT_INFOGRAPHICS"
    ;;

  dimension: chronic_flag {
    type: number
    sql: ${TABLE}."CHRONIC_FLAG" ;;
  }

  dimension: file_date {
    type: string
    sql: ${TABLE}."FILE_DATE" ;;
  }

  dimension: paid_amount {
    type: number
    sql: ${TABLE}."PAID_AMOUNT" ;;
    value_format: "0.00"
  }

  dimension: unique_id {
    type: string
    value_format_name: id
    sql: ${TABLE}."PATIENT_ID_L" ;;
  }

  dimension: proc_code__hcpcs_code {
    type: string
    sql: ${TABLE}."PROC_CODE__HCPCS_CODE" ;;
  }

  dimension: proc_group {
    type: string
    sql: ${TABLE}."PROC_GROUP" ;;
  }

  dimension: proc_subgroup {
    type: string
    sql: ${TABLE}."PROC_SUBGROUP" ;;
  }

  dimension: unnamed_0 {
    type: number
    sql: ${TABLE}."Unnamed: 0"
      ;;
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
