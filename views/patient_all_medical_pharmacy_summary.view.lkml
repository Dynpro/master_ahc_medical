view: patient_all_medical_pharmacy_summary {
  derived_table: {
    sql: select
      MP.UNIQUE_ID as UNIQUE_ID,
      MP.SERVICE_YEAR as YEAR,
      M.RISK_GROUP as RISK_GROUP,
      M.CCW_CHRONIC_CAT_LIST as CCW_CHRONIC_CAT_LIST,
      SUM(M.TOTAL_PAID_AMT) as TOTAL_PAID_AMT_M,
      SUM(M.CHRONIC_TOTAL_PAID_AMT) as CHRONIC_TOTAL_PAID_AMT,
      M.DIAGNOSIS_CATEGORY_LIST as DIAGNOSIS_CATEGORY_LIST,
      M.DIAGNOSIS_DESCRIPTION_LIST as DIAGNOSIS_DESCRIPTION_LIST,
      M.CHRONIC_CATEGORY_LIST as CHRONIC_CATEGORY_LIST,
      M.PROCEDURE_DESCRIPTION_LIST as PROCEDURE_DESCRIPTION_LIST,
      M.PROCEDURE_CATEGORY_LIST as PROCEDURE_CATEGORY_LIST

      from

      (SELECT SERVICE_YEAR, UNIQUE_ID FROM
      (SELECT LEFT("DIAGNOSIS_DATE", 4) AS SERVICE_YEAR, "UNIQUE_ID"
      FROM "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_MEDICAL"
      GROUP BY SERVICE_YEAR, "UNIQUE_ID")) AS MP


      LEFT JOIN

      (select  M1.PATIENT_ID_M as PATIENT_ID_M,
      M1.SERVICE_YEAR as SERVICE_YEAR,
      M1.RISK_GROUP as RISK_GROUP,
      M1.CCW_CHRONIC_CAT_LIST as CCW_CHRONIC_CAT_LIST,
      SUM(M1.TOTAL_PAID_AMT) as TOTAL_PAID_AMT,
      SUM(M1.CHRONIC_TOTAL_PAID_AMT) AS CHRONIC_TOTAL_PAID_AMT,
      M2.DIAGNOSIS_CATEGORY_LIST as DIAGNOSIS_CATEGORY_LIST,
      M2.DIAGNOSIS_DESCRIPTION_LIST as DIAGNOSIS_DESCRIPTION_LIST,
      M2.CHRONIC_CATEGORY_LIST as CHRONIC_CATEGORY_LIST,
      M2.PROCEDURE_DESCRIPTION_LIST as PROCEDURE_DESCRIPTION_LIST,
      M2.PROCEDURE_CATEGORY_LIST as PROCEDURE_CATEGORY_LIST
      from
      (Select
      "UNIQUE_ID" as PATIENT_ID_M,
      LEFT("DIAGNOSIS_DATE", 4) as SERVICE_YEAR,
      "RISK_GROUP" as RISK_GROUP,
      LISTAGG(DISTINCT "CCW_CHRONIC_CAT", ' || ') within group (order by "CCW_CHRONIC_CAT" ASC) as CCW_CHRONIC_CAT_LIST,
      SUM("TOTAL_EMPLOYER_PAID_AMT") as TOTAL_PAID_AMT,
      SUM(CASE WHEN "CCW_CHRONIC_CAT" IS NULL THEN 0
      ELSE "TOTAL_EMPLOYER_PAID_AMT"
      END) AS CHRONIC_TOTAL_PAID_AMT
      FROM "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_MEDICAL"
      WHERE {% condition CHRONIC_CATEGORY %} "CCW_CHRONIC_CAT" {% endcondition %}
      GROUP BY PATIENT_ID_M, SERVICE_YEAR ,RISK_GROUP) as M1

      LEFT JOIN

      (Select
      "UNIQUE_ID" as PATIENT_ID_M,
      LISTAGG(DISTINCT "ICD_DISEASE_CATEGORY", ' || ') within group (order by "ICD_DISEASE_CATEGORY" ASC) as DIAGNOSIS_CATEGORY_LIST,
      LISTAGG(DISTINCT "ICD_DESCRIPTION", ' || ') within group (order by "ICD_DESCRIPTION" ASC) as DIAGNOSIS_DESCRIPTION_LIST,
      LISTAGG(DISTINCT "CCW_CHRONIC_CAT", ' || ') within group (order by "CCW_CHRONIC_CAT" ASC) as CHRONIC_CATEGORY_LIST,
      LISTAGG(DISTINCT "PROCEDURE_DESCRIPTION", ' || ') within group (order by "PROCEDURE_DESCRIPTION" ASC) as PROCEDURE_DESCRIPTION_LIST,
      LISTAGG(DISTINCT "PROCEDURE_CATEGORY", ' || ') within group (order by "PROCEDURE_CATEGORY" ASC) as PROCEDURE_CATEGORY_LIST
      FROM "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_MEDICAL"
      GROUP BY PATIENT_ID_M) as M2

      ON M1.PATIENT_ID_M = M2.PATIENT_ID_M
      GROUP BY M1.PATIENT_ID_M, M1.SERVICE_YEAR,M1.RISK_GROUP, M1.CCW_CHRONIC_CAT_LIST, M2.DIAGNOSIS_CATEGORY_LIST, M2.DIAGNOSIS_DESCRIPTION_LIST, M2.CHRONIC_CATEGORY_LIST, M2.PROCEDURE_DESCRIPTION_LIST,
      M2.PROCEDURE_CATEGORY_LIST) as M

      ON MP.UNIQUE_ID = M.PATIENT_ID_M AND
      MP.SERVICE_YEAR = M.SERVICE_YEAR

      GROUP BY UNIQUE_ID, YEAR, RISK_GROUP,CCW_CHRONIC_CAT_LIST, DIAGNOSIS_CATEGORY_LIST, DIAGNOSIS_DESCRIPTION_LIST, CHRONIC_CATEGORY_LIST, PROCEDURE_DESCRIPTION_LIST,
      PROCEDURE_CATEGORY_LIST;;
  }
  dimension: PATIENT_ID {
    type: string
    label: "Member Id"
    sql: ${TABLE}.UNIQUE_ID ;;
  }


#Medical filters, dimension & measures:
  filter: Diagnosis_Category_1 {
    type: string
    group_label: "DIAGNOSIS CATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_disease_category
    sql: {% condition Diagnosis_Category_1 %} ${Diagnosis_Category_List_1} {% endcondition %} ;;
  }

  filter: DIAGNOSIS_DESCRIPTION_1 {
    type: string
    group_label: "DIAGNOSIS DESCRIPTION"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_description
    sql: {% condition DIAGNOSIS_DESCRIPTION_1 %} ${DIAGNOSIS_DESCRIPTION_List_1} {% endcondition %} ;;
  }

  filter: PROCEDURE_DESCRIPTION_1 {
    type: string
    group_label: "PROCEDURE DESCRIPTION"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.procedure_description
    sql: {% condition PROCEDURE_DESCRIPTION_1 %} ${PROCEDURE_DESCRIPTION_List_1} {% endcondition %} ;;
  }

  filter: PROCEDURE_CATEGORY_1 {
    type: string
    group_label: "PROCEDURE CATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.PROCEDURE_CATEGORY
    sql: {% condition PROCEDURE_CATEGORY_1 %} ${PROCEDURE_CATEGORY_List_1} {% endcondition %} ;;
  }

  filter: Chronic_Category_1 {
    type: string
    group_label: "CHRONIC CATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_chronic_cat
    sql: {% condition Chronic_Category_1 %} ${Chronic_Category_List_1} {% endcondition %} ;;
  }
  filter: CHRONIC_CATEGORY {
    type: string
    label: "Chronic Category"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_chronic_cat
  }

  dimension: Diagnosis_Category_List_1 {
    type: string
    hidden: no
    label: "Diagnosis Category List"
    sql: ${TABLE}.DIAGNOSIS_CATEGORY_LIST ;;
  }

  dimension: Chronic_Category_List_1 {
    type: string
    label: " Chronic Category list"
    drill_fields: [vw_medical.icd_chronic_cat]
    sql: ${TABLE}.CHRONIC_CATEGORY_LIST ;;
    html: {% assign words = value | split: ' || ' %}
          <ul>
          {% for word in words %}
          <li>{{ word }}</li>
          {% endfor %} ;;
  }

  dimension: PROCEDURE_CATEGORY_List_1 {
    type: string
    label: "Procedure Category List"
    sql: ${TABLE}.PROCEDURE_CATEGORY_LIST ;;
  }

  dimension: DIAGNOSIS_DESCRIPTION_List_1 {
    type: string
    label: "Diagnosis Description List"
    sql: ${TABLE}.DIAGNOSIS_DESCRIPTION_LIST ;;
  }

  dimension: PROCEDURE_DESCRIPTION_List_1 {
    type: string
    label: "Procedure Description List"
    sql: ${TABLE}.PROCEDURE_DESCRIPTION_LIST ;;
  }

  measure: total_medical_paid_amt {
    type: sum
    label: "Total Med $"
    sql: ${TABLE}.TOTAL_PAID_AMT_M ;;
  }

  dimension: reporting_year {
    type: number
    label: "Service year"
    sql: ${TABLE}.YEAR ;;
  }

#Benchmark labelling, HEDIS list of defined measures, Rendering & $ based on previous months
  dimension: benchmark_year {
    type: number
    sql: ${TABLE}.YEAR_MAX ;;
  }

  dimension: benchmark_year_2 {
    type: number
    sql: ${benchmark_year} - 1 ;;
  }

  dimension: reporting_benchmark_year {
    type: number
    label: "Reporting Year"
    sql: CASE WHEN ${reporting_year} = ${benchmark_year_2} THEN concat(${reporting_year}, ' ', '(Benchmark)')
      ELSE ${reporting_year}
      END ;;
  }

  dimension: RISK_GROUP {
    type: string
    sql: ${TABLE}.RISK_GROUP ;;
  }

  dimension: CCW_CHRONIC_CAT_LIST {
    type: string
    label: "Chronic Category"
    sql: ${TABLE}.CCW_CHRONIC_CAT_LIST ;;
  }

  measure: chronic_total_amt {
    type: sum
    label: "CHRONIC TOTAL $"
    sql: ${TABLE}."CHRONIC_TOTAL_PAID_AMT" ;;
  }

  measure: RISK_GROUP_list {
    type: string
    label: "RISK Group"
    sql: LISTAGG(DISTINCT ${RISK_GROUP}, ' || ') within group (order by ${RISK_GROUP} ASC) ;;
  }

  measure: Chronic_Category_list_2 {
    type: string
    label: "Chronic Category list"
    sql: LISTAGG(DISTINCT ${CCW_CHRONIC_CAT_LIST}, ' || ') within group (order by ${CCW_CHRONIC_CAT_LIST} ASC) ;;
    html: {% assign words = value | split: ' || ' %}
          <ul>
          {% for word in words %}
          <li>{{ word }}</li>
          {% endfor %} ;;
  }
}
