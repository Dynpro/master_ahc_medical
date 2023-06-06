view: patient_yearly_total_avg_spend_comparison {
  label: "Patient Avergae comparison (Yearly)"
  derived_table: {
    sql: select DISTINCT
      "UNIQUE_ID" as PATIENT_ID,
      LEFT("DIAGNOSIS_DATE", 4) as SERVICE_YEAR,
      "PARTICIPANT_FLAG" as PARTICIPANT_FLAG,
      "PARTICIPANT_PROGRAM_NAME" as PARTICIPANT_PROGRAM_NAME,
      LISTAGG(DISTINCT "CCW_CHRONIC_CAT", ' || ') within group (order by "CCW_CHRONIC_CAT" ASC) OVER (PARTITION BY SERVICE_YEAR, PATIENT_ID) as CHRONIC_CATEGORY_LIST,
      SUM("TOTAL_EMPLOYER_PAID_AMT") OVER (PARTITION BY SERVICE_YEAR, PATIENT_ID) as TOTAL_PATIENT_YEARLY_PAID_AMT,
      SUM("TOTAL_EMPLOYER_PAID_AMT") OVER (PARTITION BY SERVICE_YEAR) AS TOTAL_SPEND_YEARLY,
      COUNT(DISTINCT "UNIQUE_ID") OVER (PARTITION BY SERVICE_YEAR) AS TOTAL_PATIENTS_YEARLY,
      (CASE WHEN TOTAL_PATIENTS_YEARLY <> 0 THEN TOTAL_SPEND_YEARLY/TOTAL_PATIENTS_YEARLY
      ELSE 0
      END) as AVERAGE_SPEND_YEARLY,
      (select SUM("TOTAL_EMPLOYER_PAID_AMT") from "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_MEDICAL") as TOTAL_PAID_AMT_ALL_YEARS,
      (select COUNT(DISTINCT "UNIQUE_ID") from "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_MEDICAL") as TOTAL_PATIENTS_ALL_YEARS,
      (CASE WHEN TOTAL_PATIENTS_ALL_YEARS <> 0 THEN TOTAL_PAID_AMT_ALL_YEARS/TOTAL_PATIENTS_ALL_YEARS
      ELSE 0
      END) as AVERAGE_SPEND_ALL_YEARS
      FROM "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_MEDICAL"
      WHERE {% condition PARTICIPANT_FLAG %} "PARTICIPANT_FLAG" {% endcondition %} AND
      {% condition PARTICIPANT_PROGRAM_NAME %} "PARTICIPANT_PROGRAM_NAME" {% endcondition %}
      ;;
  }

  filter: PARTICIPANT_FLAG {
    type: string
    label: "PARTICIPANT FLAG"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.PARTICIPANT_NONPARTICIPANT_Flag
  }

  filter: PARTICIPANT_PROGRAM_NAME {
    type: string
    label: "PARTICIPANT PROGRAM NAME"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.PARTICIPANT_PROGRAM_NAME
  }

  dimension: patients_id {
    label: "Member ID"
    type: string
    sql: ${TABLE}."PATIENT_ID" ;;
  }

  dimension: service_year {
    type: string
    sql: ${TABLE}."SERVICE_YEAR" ;;
  }

  dimension: participant_flag {
    type: string
    sql: ${TABLE}."PARTICIPANT_FLAG" ;;
  }

  dimension: participant_program_name {
    type: string
    sql: ${TABLE}."PARTICIPANT_PROGRAM_NAME" ;;
  }

  dimension: chronic_Category_list {
    type: string
    sql: ${TABLE}."CHRONIC_CATEGORY_LIST" ;;
    html: {% assign words = value | split: ' || ' %}
      <ul>
      {% for word in words %}
      <li>{{ word }}</li>
      {% endfor %} ;;
  }

  dimension: total_patient_yearly_paid_amt_medical {
    label: "Total Member Yearly Paid Amt Medical"
    type: string
    sql: ${TABLE}."TOTAL_PATIENT_YEARLY_PAID_AMT" ;;
    value_format: "$#,##0"
  }

  dimension: total_spend_yearly_medical {
    type: string
    sql: ${TABLE}."TOTAL_SPEND_YEARLY" ;;
  }

  dimension: total_patients_yearly_medical {
    label: "Total Members Yearly Medical"
    type: string
    sql: ${TABLE}."TOTAL_PATIENTS_YEARLY" ;;
  }

  dimension: average_spend_yearly_medical {
    type: string
    sql: ${TABLE}."AVERAGE_SPEND_YEARLY" ;;
    value_format: "$#,##0.00"
  }

  dimension: total_paid_amt_all_years_medical {
    type: string
    sql: ${TABLE}."TOTAL_PAID_AMT_ALL_YEARS" ;;
  }

  dimension: total_patients_all_years_medical {
    label: "Total Members All Years Medical"
    type: string
    sql: ${TABLE}."TOTAL_PATIENTS_ALL_YEARS" ;;
  }

  dimension: average_spend_all_years_medical {
    type: string
    sql: ${TABLE}."AVERAGE_SPEND_ALL_YEARS" ;;
  }

  dimension: patient_total_spend_vs_yearly_avg_spend_medical {
    label: "Member Total Spend vs Yearly Avg Spend Medical"
    type: string
    sql: CASE WHEN ${total_patient_yearly_paid_amt_medical} >= ${average_spend_yearly_medical} THEN 'Greater than Year Average Spend'
      ELSE 'Less than Year Average Spend'
      END ;;
  }

  dimension: patient_total_spend_vs_avg_spend_medical_pharmacy {
    label: "Member Total Spend vs Avg Spend Medical Pharmacy"
    type: string
    hidden: yes
    sql: CASE WHEN ${patient_total_spend_vs_yearly_avg_spend_medical} = 'Greater than Year Average Spend'
          ELSE 'Less than Year Average Spend'
            END ;;
  }

}
