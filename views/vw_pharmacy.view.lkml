view: vw_pharmacy {
  label: "Pharmacy records"
  sql_table_name: "SCH_AHC_UPSON_REGIONAL"."LKR_TAB_PHARMACY"
    ;;

  dimension: ace_inhibitor {
    type: string
    label: "DRUG-ACE INHIBITOR ?"
    sql: ${TABLE}."ACE_INHIBITOR" ;;
  }

  dimension: arb {
    type: string
    label: "DRUG-ARB ?"
    sql: ${TABLE}."ARB" ;;
  }

  dimension: beta_blocker {
    type: string
    label: "DRUG-BETA BLOCKER ?"
    sql: ${TABLE}."BETA_BLOCKER" ;;
  }

  dimension: black_label_drug {
    type: string
    label: "DRUG-BLACK LABEL ?"
    sql: ${TABLE}."BLACK_LABEL_DRUG" ;;
  }

  dimension: brand_or_generic {
    type: string
    label: "BRAND/GENERIC"
    drill_fields: [drug_name]
    sql: ${TABLE}."BRAND_OR_GENERIC" ;;
  }

  dimension: claim_no {
    type: number
    hidden: yes
    sql: ${TABLE}."CLAIM_NO" ;;
  }

  dimension: class_code {
    type: number
    hidden: yes
    sql: ${TABLE}."CLASS_CODE" ;;
  }

  dimension_group: date_filled {
    type: time
    label: "FILLED"
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
    sql: ${TABLE}."DATE_FILLED" ;;
  }

  dimension: days_supply {
    type: number
    label: "TOTAL DAYS SUPPLY"
    sql: ${TABLE}."DAYS_SUPPLY" ;;
  }

  dimension: diagnosis_code {
    type: string
    hidden: yes
    sql: ${TABLE}."DIAGNOSIS_CODE" ;;
  }

  dimension: digestive_disease {
    type: string
    label: "DRUG-DIGESTIVE DISEASE ?"
    sql: ${TABLE}."DIGESTIVE_DISEASE" ;;
  }

  dimension: disease_category {
    type: string
    hidden: yes
    sql: ${TABLE}."DISEASE_CATEGORY" ;;
  }

  dimension: disease_group {
    type: number
    hidden: yes
    sql: ${TABLE}."DISEASE_GROUP" ;;
  }

  dimension: dri {
    type: string
    label: "DRUG-DRI ?"
    sql: ${TABLE}."DRI" ;;
  }

  dimension: drug_code {
    type: string
    label: "DRUG CODE"
    sql: ${TABLE}."DRUG_CODE" ;;
  }

  dimension: drug_indicator_generic_or_brand {
    type: yesno
    hidden: yes
    sql: ${TABLE}."DRUG_INDICATOR_GENERIC_OR_BRAND" ;;
  }

  dimension: drug_manufacturer {
    type: string
    label: "DRUG MANUFACTURER"
    sql: ${TABLE}."DRUG_MANUFACTURER" ;;
  }

  dimension: drug_manufacturer_id {
    type: string
    hidden: yes
    sql: ${TABLE}."DRUG_MANUFACTURER_ID" ;;
  }

  dimension: drug_name {
    type: string
    hidden:  yes
    sql: ${TABLE}."DRUG_NAME" ;;
  }

  dimension: drug_prescrip_over_the_counter_indicator {
    type: yesno
    hidden:  yes
    sql: ${TABLE}."DRUG_PRESCRIP_OVER_THE_COUNTER_INDICATOR" ;;
  }

  dimension: employee_gender {
    type: string
    hidden: yes
    sql: ${TABLE}."EMPLOYEE_GENDER" ;;
  }

  dimension: maintenance {
    type: string
    label: "MAINTENANCE DRUG ?"
    sql: ${TABLE}."MAINTENANCE" ;;
  }

  dimension: maintenance_drug_code {
    type: string
    hidden:  yes
    sql: ${TABLE}."MAINTENANCE_DRUG_CODE" ;;
  }

  dimension: max_refills_alowed {
    type: number
    hidden:  yes
    sql: ${TABLE}."MAX_REFILLS_ALOWED" ;;
  }

  dimension: med_use {
    type: string
    hidden:  yes
    sql: ${TABLE}."MED_USE" ;;
  }

  dimension: member_age {
    type: number
    label: "PATIENT AGE"
    sql: ${TABLE}."MEMBER_AGE" ;;
  }

  dimension: member_id {
    type: string
    hidden:  yes
    sql: ${TABLE}."MEMBER_ID" ;;
  }

  dimension: member_relationship_code {
    type: string
    hidden:  yes
    sql: ${TABLE}."MEMBER_RELATIONSHIP_CODE" ;;
  }

  dimension: member_sex {
    type: string
    label: "PATIENT GENDER"
    sql: ${TABLE}."MEMBER_SEX" ;;
  }

  dimension: new_or_refill_code {
    type: string
    hidden:  yes
    sql: ${TABLE}."NEW_OR_REFILL_CODE" ;;
  }

  dimension: non_proprietary_name {
    type: string
    label: "DRUG NAME"
    sql: ${TABLE}."NON_PROPRIETARY_NAME" ;;
  }

  dimension: pharmacist_id {
    type: string
    label: "PHARMACIST ID"
    sql: ${TABLE}."PHARMACIST_ID" ;;
  }

  dimension: pharmacy_city {
    type: string
    label: "PHARMACY CITY"
    sql: ${TABLE}."PHARMACY_CITY" ;;
  }

  dimension: pharmacy_name {
    type: string
    label: "PHARMACY NAME"
    sql: ${TABLE}."PHARMACY_NAME" ;;
  }

  dimension: pharmacy_number {
    type: number
    hidden: yes
    sql: ${TABLE}."PHARMACY_NUMBER" ;;
  }

  dimension: pharmacy_region_code {
    type: string
    label: "PHARMACY REGION CODE"
    sql: ${TABLE}."PHARMACY_REGION_CODE" ;;
  }

  dimension: pharmacy_zip_code {
    type: string
    label: "PHARMACY ZIP CODE"
    sql: ${TABLE}."PHARMACY_ZIP_CODE" ;;
  }

  dimension: place_of_service {
    type: string
    hidden: yes
    sql: ${TABLE}."PLACE_OF_SERVICE" ;;
  }

  dimension: postal_code {
    type: string
    hidden: yes
    sql: ${TABLE}."POSTAL_CODE" ;;
  }

  dimension: prescriber_id {
    type: string
    hidden: yes
    sql: ${TABLE}."PRESCRIBER_ID" ;;
  }

  dimension: prescriber_specialty_code {
    type: string
    hidden: yes
    sql: ${TABLE}."PRESCRIBER_SPECIALTY_CODE" ;;
  }

  dimension: prescriber_state {
    type: string
    hidden: yes
    sql: ${TABLE}."PRESCRIBER_STATE" ;;
  }

  dimension: prescription_no {
    type: string
    hidden: yes
    sql: ${TABLE}."PRESCRIPTION_NO" ;;
  }

  dimension_group: prescription_written {
    type: time
    hidden: yes
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
    sql: ${TABLE}."PRESCRIPTION_WRITTEN_DATE" ;;
  }

  dimension: primary_care_provider_id {
    type: string
    hidden: yes
    sql: ${TABLE}."PRIMARY_CARE_PROVIDER_ID" ;;
  }

  dimension: primary_physician_id {
    type: string
    hidden: yes
    sql: ${TABLE}."PRIMARY_PHYSICIAN_ID" ;;
  }

  dimension: product_pkg_size {
    type: string
    hidden: yes
    sql: ${TABLE}."PRODUCT_PKG_SIZE" ;;
  }

  dimension: product_pkg_unit_of_measure {
    type: string
    hidden: yes
    sql: ${TABLE}."PRODUCT_PKG_UNIT_OF_MEASURE" ;;
  }

  dimension: proprietary_name {
    type: string
    hidden: yes
    sql: ${TABLE}."PROPRIETARY_NAME" ;;
  }

  dimension: quantity_dispensed {
    type: number
    label: "QUANTITY DISPENSED"
    sql: ${TABLE}."QUANTITY_DISPENSED" ;;
  }

  dimension: relationship_to_employee {
    type: string
    label: "RELATIONSHIP TO EMPLOYEE"
    sql: ${TABLE}."RELATIONSHIP_TO_EMPLOYEE" ;;
  }

  dimension_group: service {
    type: time
    hidden: yes
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
    sql: ${TABLE}."SERVICE_DATE" ;;
  }

  dimension: specialty_drugs {
    type: string
    label: "SPECIALTY DRUGS ?"
    sql: ${TABLE}."SPECIALTY_DRUGS" ;;
  }

  dimension: statin {
    type: string
    label: "STATIN DRUGS ?"
    sql: ${TABLE}."STATIN" ;;
  }

  dimension: tea_category {
    type: string
    label: "TEA CATEGORY"
    drill_fields: [drug_name, brand_or_generic]
    sql: ${TABLE}."TEA_CATEGORY" ;;
  }

  dimension: therapeutic_class_code {
    type: number
    label: "THERAPEUTIC CLASS CODE"
    sql: ${TABLE}."THERAPEUTIC_CLASS_CODE" ;;
  }

  dimension: therapeutic_class_code_description {
    type: string
    label: "THERAPEUTIC CLASS CODE DESCRIPTION"
    sql: ${TABLE}."THERAPEUTIC_CLASS_CODE_DESCRIPTION" ;;
  }

  dimension: total_billed_amt {
    type: number
    hidden: yes
    sql: ${TABLE}."TOTAL_BILLED_AMT" ;;
  }

  dimension: total_employer_paid_amt {
    type: number
    hidden: yes
    sql: ${TABLE}."TOTAL_EMPLOYER_PAID_AMT" ;;
  }

  dimension: total_patient_paid_amt {
    type: number
    hidden: yes
    sql: ${TABLE}."TOTAL_PATIENT_PAID_AMT" ;;
  }

  dimension: unique_id {
    type: string
    primary_key: yes
    hidden: no
    sql: ${TABLE}."UNIQUE_ID" ;;
  }

  # dimension: Unique_Id_P {
  #   type: string
  #   primary_key: yes
  #   sql: ${unique_id} ;;
  # }

  measure: employer_paid_amount {
    type: sum
    label: "TOTAL $"
    sql: ${total_employer_paid_amt} ;;
    value_format: "$#,##0"
  }

  measure: total_visits {
    type: count
    label: "TOTAL VISITS"
    drill_fields: [unique_id]
  }

  measure: total_patients {
    type: count_distinct
    label: "N"
    sql: ${unique_id} ;;
  }

  measure: avg_employer_paid_amount{
    type: number
    label: "MEAN $"
    sql: CASE WHEN ${total_patients} <> 0 THEN ${employer_paid_amount}/${total_patients}
        ELSE 0
        END;;
    value_format: "$#,##0"
  }

  measure: count {
    type: count
    hidden: yes
    label: "TOTAL RECORDS"
    drill_fields: [drug_name, proprietary_name, pharmacy_name, non_proprietary_name]
  }

  dimension: RISK_GROUP {
    type: string
    label: "RISK GROUPS"
    sql: ${TABLE}."RISK_GROUP" ;;
  }

  measure: Filled_date_Min {
    type: date
    label: "PHARMACY Claim - START"
    sql: MIN(${reporting_raw}) ;;
    html: {{ rendered_value | date: "%m / %d / %Y" }} ;;
  }

  measure: Filled_date_Max {
    type: date
    label: "PHARMACY Claim - END"
    sql: MAX(${reporting_raw}) ;;
    html: {{ rendered_value | date: "%m / %d / %Y" }} ;;
  }

  dimension_group: paid_date {
    type: time
    label: "FILLED"
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
    sql: ${TABLE}."PAID_DATE" ;;
  }

  parameter: reporting_date_filter {
    type: string
    label: "Reporting date"
    allowed_value: {
      value: "Service"
      label: "Service date"}
    allowed_value: {
      value: "Paid"
      label: "Paid date"}
  }
  dimension_group: reporting {
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
    label: "Reporting"
    drill_fields: [reporting_year, reporting_quarter, reporting_month, reporting_raw]
    sql: CASE WHEN {% parameter reporting_date_filter %} = 'Paid' THEN ${TABLE}."PAID_DATE"
      WHEN {% parameter reporting_date_filter %} = 'Service' THEN ${TABLE}."DATE_FILLED"
      ELSE ${TABLE}."DATE_FILLED"
      END ;;
  }
#Benchmark labelling, HEDIS list of defined measures, Rendering & $ based on previous months
  dimension: benchmark_year_filter_suggestion {
    type: string
    hidden: yes
    sql: ${reporting_year} - 1 ;;
  }

  parameter: benchmark_year_filter {
    type: string
    suggest_dimension: vw_pharmacy.benchmark_year_filter_suggestion
  }

  dimension: reporting_benchmark_year {
    type: string
    label: "SERVICE Year"
    sql: CASE WHEN ${date_filled_year} = CAST({% parameter benchmark_year_filter %} as int) THEN CAST(concat(${date_filled_year}, ' ', '(Benchmark)') as string)
      ELSE CAST(${date_filled_year} as string)
      END;;
  }


  measure: drug_name_list {
    sql: LISTAGG(DISTINCT ${drug_name}, ' || ') within group (order by ${drug_name} ASC) ;;
    html: {% assign words = value | split: ' || ' %}
      <ul>
      {% for word in words %}
      <li>{{ word }}</li>
      {% endfor %} ;;
  }

  measure: tea_category_list {
    sql: LISTAGG(DISTINCT ${tea_category}, ' || ') within group (order by ${tea_category} ASC) ;;
    html: {% assign words = value | split: ' || ' %}
      <ul>
      {% for word in words %}
      <li>{{ word }}</li>
      {% endfor %} ;;
  }

  dimension: EMPLOYER_NAME {
    type: string
    label: "Affiliation"
    sql: ${TABLE}."EMPLOYER_NAME" ;;
  }



}
