view: vw_med_and_pharma_summary_1 {
  label: "Ad Hoc Query Tool"
  derived_table: {
    sql: select
          "UNIQUE_ID" as PATIENT_ID_M,
          "PATIENT_GENDER" as PATIENT_GENDER,
          "RELATIONSHIP_TO_EMPLOYEE" as RELATIONSHIP_TO_EMPLOYEE,
          "PAID_DATE" as PAID_DATE,
          "DIAGNOSIS_DATE" as DIAGNOSIS_DATE,
          "PATIENT_AGE" as PATIENT_AGE,
          "AGE_GROUP_1" as AGE_GROUP_1,
          "TOTAL_BILLED_AMT" as Total_Billed_Amt_M,
          "TOTAL_EMPLOYER_PAID_AMT" as Total_Paid_Amt_M,
          "ICD_DESCRIPTION" as ICD_DISEASE_DESCRIPTION,
          "ICD_DISEASE_CATEGORY" as ICD_DISEASE_CATEGORY,
          "DISEASE_SUB_CATEGORY" as DISEASE_SUB_CATEGORY,
          "RECONCILED_DIAGNOSIS_CODE_ICD10" as RECONCILED_DIAGNOSIS_CODE_ICD10,
          "CCW_CHRONIC_CAT" as CCW_CHRONIC_CAT,
          "PROCEDURE_DESCRIPTION" as PROCEDURE_DESCRIPTION,
          "PROCEDURE_CATEGORY" as PROCEDURE_CATEGORY,
          "PROCEDURE_SUBCATEGORY" as PROCEDURE_SUB_CATEGORY,
          "PRIMARY_PROCEDURE_CODE" as PRIMARY_PROCEDURE_CODE,
          "PLACE_OF_SERVICE_DESCRIPTION" as PLACE_OF_SERVICE_DESCRIPTION,
          "SERVICE_PROVIDER_SPECIALITY_CODE_DESC" as SERVICE_PROVIDER_SPECIALITY_CODE_DESC,
          "PARTICIPANT_PROGRAM_NAME" as PARTICIPANT_PROGRAM_NAME
         from
        "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_MEDICAL"
        WHERE                                 /* Dynamic Filter condition*/
            {% condition DISEASE_CATEGORY %} "ICD_DISEASE_CATEGORY" {% endcondition %} AND
            {% condition PROCEDURE_MAJOR_CATEGORY %} "PROCEDURE_CATEGORY" {% endcondition %} AND
            {% condition PROCEDURE_SUBCATEGORY %} "PROCEDURE_SUBCATEGORY" {% endcondition %} AND
            {% condition DISEASE_SUBCATEGORY %} "DISEASE_SUB_CATEGORY" {% endcondition %} AND
            {% condition DISEASE_DESCRIPTION %} "ICD_DESCRIPTION" {% endcondition %} AND
            {% condition DIAGNOSIS_CODE %} "RECONCILED_DIAGNOSIS_CODE_ICD10" {% endcondition %} AND
            {% condition CHRONIC_CATEGORY %} "CCW_CHRONIC_CAT" {% endcondition %} AND
            {% condition GENDER %} "PATIENT_GENDER" {% endcondition %} AND
            {% condition EMPLOYEE_RELATIONSHIP %} "RELATIONSHIP_TO_EMPLOYEE" {% endcondition %} AND
            {% condition PLACE_OF_SERVICE_DESC %} "PLACE_OF_SERVICE_DESCRIPTION" {% endcondition %} AND
            {% condition MAJOR_DISEASE_DIABETES %} "ICD_MAJOR_DISEASE" {% endcondition %} AND
            {% condition PROCEDURE_CODE_TYPE %} "PROCEDURE_CODE_TYPE" {% endcondition %} AND
            {% condition PROCEDURE_CODE_DESC %} "PROCEDURE_DESCRIPTION" {% endcondition %} AND
            {% condition PROCEDURE_CODE %} "PRIMARY_PROCEDURE_CODE" {% endcondition %} AND
            {% condition LS_MODIFY_OR_NOT %} "ICD_LS_MODIFY" {% endcondition %} AND
            {% condition ACUTE_OR_NOT %} "CHRONICITY_IDENTIFIER" {% endcondition %} AND
            {% condition PREVENTATIVE_OR_NOT %} "ICD_PREVENTATIVE" {% endcondition %} AND
            {% condition CHRONIC_OR_NOT %} "CHRONICITY_IDENTIFIER" {% endcondition %} AND
            {% condition AVOIDABLE_ER_OR_NOT %} "ICD_AVOIDABLE_ER" {% endcondition %} AND
            {% condition DIGESTIVE_DISEASE_OR_NOT %} "ICD_DIGESTIVE_DISEASE" {% endcondition %} AND

      "UNIQUE_ID" IN (select DISTINCT "UNIQUE_ID" from  "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_MEDICAL"
      WHERE {% condition PARTICIPANT_YEAR %} LEFT("ON_BOARD_DATE", 4) {% endcondition %} AND
      {% condition PARTICIPANT_Flag %} "PARTICIPANT_FLAG" {% endcondition %})
      ;;
  }

  filter: DISEASE_CATEGORY {
    #default_value: "Diseases of the Musculoskeletal System and Connective Tissue"
    type: string
    label: "DIAGNOSTIC CATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.DISEASE_CATEGORY
  }

  filter: DISEASE_SUBCATEGORY {
    #default_value: "Diseases of the Musculoskeletal System and Connective Tissue"
    type: string
    label: "DIAGNOSTIC SUBCATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.DIAGNOSIS_SUB_CATEGORY
  }

  filter: PROCEDURE_MAJOR_CATEGORY {
    #default_value: "Diseases of the Musculoskeletal System and Connective Tissue"
    type: string
    label: "PROCEDURE CATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.PROCEDURE_CATEGORY
  }

  filter: PROCEDURE_SUBCATEGORY {
    #default_value: "Diseases of the Musculoskeletal System and Connective Tissue"
    type: string
    label: "PROCEDURE SUBCATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.PROCEDURE_SUB_CATEGORY
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

  filter: PLACE_OF_SERVICE_DESC {
    type: string
    label: "PLACE OF SERVICE DESC"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.place_of_service_description
  }

  filter: PROCEDURE_CODE_TYPE {
    type: string
    label: "PROCEDURE CODE TYPE"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.procedure_code_type
  }

  filter: LS_MODIFY_OR_NOT {
    type: string
    label: "LIFESTYLE MODIFIABLE ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_ls_modify
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


  #Medical Dimension & Measure.
  dimension: PATIENT_ID {
    type: string
    primary_key: yes
    label: "MEMBER ID"
    hidden: yes
    sql: ${TABLE}.PATIENT_ID_M ;;
  }

  dimension_group: PAID_DATE {
    type: time
    label: "PAID"
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
    drill_fields: [PAID_DATE_year, PAID_DATE_quarter, PAID_DATE_month, PAID_DATE_week, PAID_DATE_raw]
    sql: ${TABLE}."PAID_DATE" ;;
  }

  dimension_group: DIAGNOSIS_DATE {
    type: time
    label: "Service"
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
    drill_fields: [DIAGNOSIS_DATE_year, DIAGNOSIS_DATE_quarter, DIAGNOSIS_DATE_month, DIAGNOSIS_DATE_week, DIAGNOSIS_DATE_raw]
    sql: ${TABLE}."DIAGNOSIS_DATE" ;;
  }

  dimension: PATIENT_GENDER {
    type: string
    label: "MEMBER GENDER"
    drill_fields: [RELATIONSHIP_TO_EMPLOYEE, CHRONIC_CATEGORY, DISEASE_CATEGORY, DISEASE_SUB_CATEGORY, DISEASE_DESCRIPTION, RECONCILED_DIAGNOSIS_CODE_ICD10, PROCEDURE_CATEGORY, PROCEDURE_SUB_CATEGORY, PROCEDURE_DESCRIPTION, PRIMARY_PROCEDURE_CODE, PLACE_OF_SERVICE_DESCRIPTION]
    sql: ${TABLE}.PATIENT_GENDER ;;
  }

  dimension: RELATIONSHIP_TO_EMPLOYEE {
    type: string
    label: "RELATIONSHIP TO EMPLOYEE"
    drill_fields: [PATIENT_GENDER, CHRONIC_CATEGORY, DISEASE_CATEGORY, DISEASE_SUB_CATEGORY, DISEASE_DESCRIPTION, RECONCILED_DIAGNOSIS_CODE_ICD10, PROCEDURE_CATEGORY, PROCEDURE_SUB_CATEGORY, PROCEDURE_DESCRIPTION, PRIMARY_PROCEDURE_CODE]
    sql: ${TABLE}.RELATIONSHIP_TO_EMPLOYEE ;;
  }

  dimension: ICD_DISEASE_CATEGORY {
    type: string
    label: "DIAGNOSTIC CATEGORY"
    drill_fields: [DISEASE_SUB_CATEGORY, DISEASE_DESCRIPTION, RECONCILED_DIAGNOSIS_CODE_ICD10, PROCEDURE_CATEGORY, PROCEDURE_SUB_CATEGORY, PROCEDURE_DESCRIPTION, PRIMARY_PROCEDURE_CODE, CHRONIC_CATEGORY]
    sql: ${TABLE}.ICD_DISEASE_CATEGORY ;;
  }

  dimension: DISEASE_SUB_CATEGORY {
    type: string
    label: "DIAGNOSTIC SUCATEGORY"
    drill_fields: [DISEASE_DESCRIPTION, RECONCILED_DIAGNOSIS_CODE_ICD10, PROCEDURE_CATEGORY, PROCEDURE_SUB_CATEGORY, PROCEDURE_DESCRIPTION, PRIMARY_PROCEDURE_CODE, CHRONIC_CATEGORY]
    sql: ${TABLE}.DISEASE_SUB_CATEGORY ;;
  }

  dimension: ICD_DISEASE_DESCRIPTION {
    type: string
    label: "DISEASE DESCRIPTION"
    sql: ${TABLE}.ICD_DISEASE_DESCRIPTION ;;
  }

  dimension: ICD_CHRONIC_CAT {
    type: string
    label: "CHRONIC CATEGORY"
    drill_fields: [PATIENT_GENDER, CHRONIC_CATEGORY, DISEASE_CATEGORY, DISEASE_DESCRIPTION, RECONCILED_DIAGNOSIS_CODE_ICD10, PROCEDURE_DESCRIPTION, PRIMARY_PROCEDURE_CODE, PLACE_OF_SERVICE_DESCRIPTION]
    sql: ${TABLE}.CCW_CHRONIC_CAT ;;
  }

  dimension: PROCEDURE_DESCRIPTION {
    type: string
    label: "PROCEDURE DESCRIPTION"
    sql: ${TABLE}.PROCEDURE_DESCRIPTION ;;
  }

  dimension: PROCEDURE_CATEGORY {
    type: string
    label: "PROCEDURE CATEGORY"
    drill_fields: [PROCEDURE_SUB_CATEGORY, PROCEDURE_DESCRIPTION, PRIMARY_PROCEDURE_CODE]
    sql: ${TABLE}.PROCEDURE_CATEGORY ;;
  }

  dimension: PROCEDURE_SUB_CATEGORY {
    type: string
    label: "PROCEDURE SUBCATEGORY"
    drill_fields: [PROCEDURE_DESCRIPTION, PRIMARY_PROCEDURE_CODE]
    sql: ${TABLE}.PROCEDURE_SUB_CATEGORY ;;
  }

  dimension: RECONCILED_DIAGNOSIS_CODE_ICD10 {
    type: string
    label: "DIAGNOSIS/ICD CODE"
    sql: ${TABLE}.RECONCILED_DIAGNOSIS_CODE_ICD10 ;;
  }

  dimension: PRIMARY_PROCEDURE_CODE {
    type: string
    label: "PROCEDURE CODE"
    sql: ${TABLE}.PRIMARY_PROCEDURE_CODE ;;
  }

  dimension: PLACE_OF_SERVICE_DESCRIPTION {
    type: string
    label: "PLACE OF SERVICE DESCRIPTION"
    drill_fields: [DISEASE_CATEGORY, DISEASE_DESCRIPTION, RECONCILED_DIAGNOSIS_CODE_ICD10, PROCEDURE_DESCRIPTION, PRIMARY_PROCEDURE_CODE]
    sql: ${TABLE}.PLACE_OF_SERVICE_DESCRIPTION ;;
  }

  dimension: SERVICE_PROVIDER_SPECIALITY_CODE_DESC {
    type: string
    label: "SERVICE PROVIDER SPECIALITY CODE DESCRIPTION"
    sql: ${TABLE}.SERVICE_PROVIDER_SPECIALITY_CODE_DESC ;;
  }

  dimension: PATIENT_AGE {
    type: string
    label: "MEMBER AGE"
    sql: ${TABLE}.PATIENT_AGE ;;
  }

  dimension: AGE_GROUP_1 {
    type: string
    label: "AGE GROUP"
    drill_fields: [PATIENT_GENDER, CHRONIC_CATEGORY, DISEASE_CATEGORY, DISEASE_DESCRIPTION, RECONCILED_DIAGNOSIS_CODE_ICD10, PRIMARY_PROCEDURE_CODE, PROCEDURE_DESCRIPTION, PLACE_OF_SERVICE_DESCRIPTION]
    sql: ${TABLE}.AGE_GROUP_1 ;;
  }

  measure: Total_Billed_Amt_M {
    type: sum
    label: "MED-TOTAL BILLED $"
    sql: ${TABLE}.Total_Billed_Amt_M ;;
    value_format: "$#,##0"
  }

  measure: TOTAL_PAID_AMT_M {
    type: sum
    label: "MED-TOTAL $"
    sql: ${TABLE}.Total_Paid_Amt_M ;;
    value_format: "$#,##0"
  }

  measure: AVERAGE_PAID_AMT_M {
    type: number
    label: "MED-MEAN $"
    sql: CASE WHEN ${TOTAL_PATIENTS} <> 0 THEN ${TOTAL_PAID_AMT_M}/${TOTAL_PATIENTS}
          ELSE 0
          END;;
    value_format: "$#,##0"
  }

  measure: TOTAL_PATIENTS {
    type: count_distinct
    label: "N"
    sql: ${PATIENT_ID} ;;
  }

  dimension: PARTICIPANT_PROGRAM_NAME{
    type: string
    label: "PARTICIPANT PROGRAM NAME"
    sql: ${TABLE}."PARTICIPANT_PROGRAM_NAME";;
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
