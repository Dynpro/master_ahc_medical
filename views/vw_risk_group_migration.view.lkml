view: vw_risk_group_migration {
  label: "Risk Group Summary"
  derived_table: {
    sql: select * from "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_RISK_GROUP_MIGRATION"
          WHERE
          UNIQUE_ID IN (select DISTINCT UNIQUE_ID from "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_MEDICAL"
          WHERE
          {% condition DISEASE_CATEGORY %} "ICD_DISEASE_CATEGORY" {% endcondition %} AND
          {% condition DISEASE_DESCRIPTION %} "ICD_DESCRIPTION" {% endcondition %} AND
          {% condition DIAGNOSIS_CODE %} "RECONCILED_DIAGNOSIS_CODE_ICD10" {% endcondition %} AND
          {% condition PROCEDURE_CODE_DESC %} "PROCEDURE_DESCRIPTION" {% endcondition %} AND
          {% condition PROCEDURE_CODE %} "PRIMARY_PROCEDURE_CODE" {% endcondition %} AND
          {% condition CHRONIC_CATEGORY %} "CCW_CHRONIC_CAT" {% endcondition %} AND
          {% condition GENDER %} "PATIENT_GENDER" {% endcondition %} AND
          {% condition EMPLOYEE_RELATIONSHIP %} "RELATIONSHIP_TO_EMPLOYEE" {% endcondition %} AND
          {% condition MAJOR_DISEASE_DIABETES %} "ICD_MAJOR_DISEASE" {% endcondition %} AND
          {% condition ACUTE_OR_NOT %} "CHRONICITY_IDENTIFIER" {% endcondition %} AND
          {% condition PREVENTATIVE_OR_NOT %} "ICD_PREVENTATIVE" {% endcondition %} AND
          {% condition CHRONIC_OR_NOT %} "CHRONICITY_IDENTIFIER" {% endcondition %} AND
          {% condition AVOIDABLE_ER_OR_NOT %} "ICD_AVOIDABLE_ER" {% endcondition %} AND
          {% condition DIGESTIVE_DISEASE_OR_NOT %} "ICD_DIGESTIVE_DISEASE" {% endcondition %} AND
            {% condition PARTICIPANT_YEAR %} LEFT("PAID_DATE", 4) {% endcondition %} AND
            {% condition PARTICIPANT_Flag %} "PARTICIPANT_FLAG" {% endcondition %})
           ;;
  }

  drill_fields: [Unique_id, File_year, Risk_group, Total_paid_amt, Mean_paid_amt, Chronic, Chronic_count, Comorbid, Comorbid_count]


  dimension: Unique_id {
    type: string
    sql: ${TABLE}."UNIQUE_ID" ;;
  }

  dimension: Chronic {
    type: yesno
    sql: ${TABLE}."CHRONIC" ;;
  }

  dimension: Chronic_count {
    type: number
    sql: ${TABLE}."CHRONIC_COUNT" ;;
  }

  dimension: Comorbid {
    type: yesno
    sql: ${TABLE}."COMORBID" ;;
  }

  dimension: Comorbid_count {
    type: number
    sql: ${TABLE}."COMORBID_COUNT" ;;
  }

  dimension: File_year {
    type: number
    sql: ${TABLE}."FILE_YEAR" ;;
    value_format: "0"
  }

  dimension: Risk_group {
    type: string
    sql: ${TABLE}."RISK_GROUP" ;;
  }

  measure: Total_paid_amt {
    type: sum
    label: "Total $"
    sql: ${TABLE}."TOTAL_PAID_AMT" ;;
    value_format: "$#,##0"
  }

  measure: Mean_paid_amt {
    type: number
    label: "Mean $"
    sql: CASE WHEN ${Total_Patients} <> 0 THEN ${Total_paid_amt}/${Total_Patients}
        ELSE 0
        END;;
    value_format: "$#,##0"
  }

  measure: Total_Patients {
    type: count_distinct
    label: "N"
    sql:  ${Unique_id};;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }

  dimension: Comorbid_Group {
    type: string
    label: "COMORBID GROUP"
    sql: CASE WHEN ${Comorbid_count} < '2' THEN '0-1'
        WHEN ${Comorbid_count} >= '2' AND ${Comorbid_count} < '4' THEN '2 to 3'
        ELSE '4 or more'
        END ;;
  }

  #Medical filters applied on vw_medical tab.
  filter: DISEASE_CATEGORY {
    #default_value: "Diseases of the Musculoskeletal System and Connective Tissue"
    type: string
    label: "DISEASE CATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_disease_category
  }

  filter: DISEASE_DESCRIPTION {
    type: string
    label: "DISEASE DESCRIPTION"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_description
  }

  filter: DIAGNOSIS_CODE {
    type: string
    label: "DIAGNOSIS CODE"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.reconciled_diagnosis_code_icd10
  }

  filter: PROCEDURE_CODE_DESC {
    type: string
    label: "PROCEDURE DESCRIPTION"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.procedure_description
  }

  filter: PROCEDURE_CODE {
    type: string
    label: "PROCEDURE CODE"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.primary_procedure_code
  }

  filter: CHRONIC_CATEGORY {
    type: string
    label: "CHRONIC CATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_chronic_cat
  }

  filter: GENDER {
    type: string
    label: "GENDER"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.patient_gender
  }

  filter: EMPLOYEE_RELATIONSHIP {
    type: string
    label: "EMPLOYEE/SPOUSE/DEPENDENT"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.relationship_to_employee
  }

  filter: MAJOR_DISEASE_DIABETES {
    type: string
    label: "DIABETES ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.ICD_MAJOR_DISEASE
  }

  filter: ACUTE_OR_NOT {
    type: string
    label: "ACUTE ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_acute
  }

  filter: PREVENTATIVE_OR_NOT {
    type: string
    label: "PREVENTATIVE ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_preventative
  }

  filter: CHRONIC_OR_NOT {
    type: string
    label: "CHRONIC ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.2012_chronic
  }

  filter: AVOIDABLE_ER_OR_NOT {
    type: string
    label: "AVOIDABLE ER ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_avoidable_er
  }

  filter: DIGESTIVE_DISEASE_OR_NOT {
    type: string
    label: "DIGESTIVE DISEASE ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_digestive_disease
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

  dimension: patient_age {
    type: number
    label: "PATIENT AGE"
    sql: ${TABLE}."PATIENT_AGE" ;;
  }
  dimension: ageGroup {
    type: tier
    label: "AGE GROUP-2"
    tiers: [20, 30, 40, 50, 60]
    description: "AGE Group>> 0-19, 20-29, 30-39, 40-49, 50-59 & >=60 yrs"
    style: integer
    sql:  ${patient_age};;
  }

  dimension: Disease_Groups {
    label: "Disease Groups"
    type: string
    sql: case when ${Risk_group} = 'GROUP-1' THEN 'Disease Group-1'
              when ${Risk_group} = 'GROUP-2' THEN 'Disease Group-2'
              when ${Risk_group} = 'GROUP-3' THEN 'Disease Group-3'
              when ${Risk_group} = 'GROUP-4' THEN 'Disease Group-4'
              when ${Risk_group} = 'GROUP-5' THEN 'Disease Group-5'
              when ${Risk_group} = 'GROUP-6' THEN 'Disease Group-6'
              when ${Risk_group} = 'GROUP-7' THEN 'Disease Group-7'
      ELSE '0'
      END;;
  }

  dimension: Groups_Definition {
    label: "Groups Definition"
    type: string
    sql: case when ${Disease_Groups} = 'Disease Group-1' THEN 'No Chronic Disease and Less Than $1500 Medical Expenditures per 12 Months'
              when ${Disease_Groups} = 'Disease Group-2' THEN 'No Chronic Disease and $1500 or More Medical Expenditures per 12 Months'
              when ${Disease_Groups} = 'Disease Group-3' THEN 'One Chronic Disease'
              when ${Disease_Groups} = 'Disease Group-4' THEN 'Two Chronic Disease'
              when ${Disease_Groups} = 'Disease Group-5' THEN 'Three Chronic Disease'
              when ${Disease_Groups} = 'Disease Group-6' THEN 'Four Chronic Disease'
              when ${Disease_Groups} = 'Disease Group-7' THEN 'Five or More Chronic Disease'
          ELSE '0'
          END;;
  }
  measure: chronic_paid_amt {
    type: sum
    label: "Chronic Total $"
    sql: ${TABLE}."CHRONIC_PAID_AMT" ;;
    value_format: "$#,##0"
  }

  dimension: Chronic_Category {
    type: string
    label: "Chronic Category"
    sql: ${TABLE}."CHRONIC_CAT";;
  }
}
