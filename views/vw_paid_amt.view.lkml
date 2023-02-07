view: vw_paid_amt {
  sql_table_name: "DB_KAIROS_PROD"."SCH_AHC_UPSON_REGIONAL"."VW_HISTORY_24_MONTH";;

  dimension: unique_id {
    type: string
    sql: ${TABLE}."UNIQUE_ID" ;;
  }


  dimension: base_year {
    type: string
    sql: CAST(${TABLE}."BASE_YEAR" as integer) ;;
  }

  dimension: file_year {
    type: string
    sql: CAST(${TABLE}."FILE_YEAR" as integer) ;;
  }

  measure: paid_amt {
    type: sum
    label: "PAID AMT"
    sql: ${TABLE}."TOTAL_EMPLOYER_PAID_AMT" ;;
  }


  measure: predicted_paid_amt {
    type:  sum
    sql:${vw_predictive_healthscore_index."avg_predicted_paid_amount"};;
    # value_format: "$0.00,\" K\""
  }

}
