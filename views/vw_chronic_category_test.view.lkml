view: vw_chronic_category_test {
  derived_table: {

    sql:
    WITH sample_table as
        (SELECT distinct vw_predicitve_chronic_data."UNIQUE_ID" as PID,
        vw_predicitve_chronic_data."BASE_YEAR" as YR
        FROM "DB_KAIROS_PROD"."SCH_AHC_UPSON_REGIONAL"."ML_CHRONICITY_DETAILS" AS vw_predicitve_chronic_data
        WHERE {% condition Chronic_Category %}"CCW_CHRONIC_CAT" {% endcondition %})

      select PID, YR from sample_table
      LEFT JOIN "DB_KAIROS_PROD"."SCH_AHC_UPSON_REGIONAL"."ML_FINAL_TRAIN_TEST"  AS vw_predictive_healthscore_index
      ON (vw_predictive_healthscore_index."PATIENT_ID_L") =  (sample_table."PID") and
      (CAST(vw_predictive_healthscore_index."YEAR_FILE_DATE_L" as integer)) = (sample_table."YR")


      ;;
  }

  dimension: patient_id {
    type:number
    label: "Patient Id"
    sql: ${TABLE}.PID ;;
  }

  dimension: year_file_date_l  {
    type: string
    label: "Year"
    sql: ${TABLE}.YR ;;
  }





  filter: Chronic_Category {
    type: string
    label: "Chronic Category"
    suggest_explore: ad_hoc_query_tool_medical
    suggest_dimension: ad_hoc_query_tool_medical.ICD_CHRONIC_CAT_LIST
    # sql:  ;;
  }

  dimension: Chronic_Category_1 {
    type: string
    sql: ${TABLE}."Chronic_Category" ;;
  }


  # filter: Chronic_Category {
  #   type: string
  #   label: "Chronic Category"
  #   suggest_explore: vw_predictive_chronic_data
  #   suggest_dimension: vw_predictive_chronic_data.ccw_description
  #   # sql: {% condition Chronic_Category %} ${chronic_cat_list} {% endcondition %} ;;

  # }
}
