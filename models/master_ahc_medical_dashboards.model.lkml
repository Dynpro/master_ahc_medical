connection: "snowflake_prod"

# include all the views
include: "/views/**/*.view"

datagroup: master_ahc_medical_dashboards_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: master_ahc_medical_dashboards_default_datagroup


explore: vw_medical {
  label: "Medical records"
  join: patient_diagnosis_summary {
    view_label: "Patient Diagnosis Summary"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_medical.unique_id} = ${patient_diagnosis_summary.PATIENT_ID} AND
      LEFT(${vw_medical.reporting_year}, 4) = ${patient_diagnosis_summary.reporting_year} ;;
  }
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_medical.unique_id} = ${vw_patient_demographics.unique_id} ;;
  }
  join: vw_risk_group_migration {
    view_label: "Risk Group Migration"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_medical.unique_id} = ${vw_risk_group_migration.Unique_id} AND
      ${vw_medical.diagnosis_year} = ${vw_risk_group_migration.File_year};;
  }
  join: vw_participant_trigger {
    view_label: "Participant Trigger"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_medical.unique_id} = ${vw_participant_trigger.unique_id} ;;
  }

  join: vw_vital_alert {
    view_label: "Vital Report"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_medical.unique_id} = ${vw_vital_alert.unique_id} AND
      ${vw_medical.diagnosis_year} = ${vw_vital_alert.date_year};;
  }

  join : patient_migration_across_years_summary{
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_medical.unique_id} = ${patient_migration_across_years_summary.UNIQUE_ID}  ;;
  }
}

explore: vw_pharmacy {
  label: "Pharmacy records"
  join: patient_drug_summary {
    view_label: "Patient Drug Summary"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_pharmacy.unique_id} = ${patient_drug_summary.PATIENT_ID} AND
      LEFT(${vw_pharmacy.reporting_year}, 4) = ${patient_drug_summary.reporting_year} ;;
  }
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_pharmacy.unique_id} = ${vw_patient_demographics.unique_id} ;;
  }
  join: vw_participant_trigger {
    view_label: "Participant Trigger"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_pharmacy.unique_id} = ${vw_participant_trigger.unique_id} ;;
  }
  join: vw_vital_alert {
    view_label: "Vital Report"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_pharmacy.unique_id} = ${vw_vital_alert.unique_id} AND
      LEFT(${vw_pharmacy.reporting_year}, 4) = ${vw_vital_alert.date_year};;
  }
}

explore: vw_med_and_pharma_summary_1 {
  label: "Ad Hoc Query Tool"
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on:  ${vw_med_and_pharma_summary_1.PATIENT_ID} = ${vw_patient_demographics.unique_id} ;;
  }
  join: vw_participant_trigger {
    view_label: "Participant Trigger"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_med_and_pharma_summary_1.PATIENT_ID} = ${vw_participant_trigger.unique_id} ;;
  }
}

explore: ad_hoc_query_tool_medical {
  label: "Ad Hoc Query Tool_MEDICAL"
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on:  ${ad_hoc_query_tool_medical.PATIENT_ID} = ${vw_patient_demographics.unique_id} ;;
  }
  join: vw_participant_trigger {
    view_label: "Participant Trigger"
    type: left_outer
    relationship: many_to_one
    sql_on: ${ad_hoc_query_tool_medical.PATIENT_ID} = ${vw_participant_trigger.unique_id} ;;
  }
}

explore: ad_hoc_query_tool_pharmacy {
  label: "Ad Hoc Query Tool_PHARMACY"
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on:  ${ad_hoc_query_tool_pharmacy.Unique_Id_P} = ${vw_patient_demographics.unique_id} ;;
  }
  join: vw_participant_trigger {
    view_label: "Participant Trigger"
    type: left_outer
    relationship: many_to_one
    sql_on: ${ad_hoc_query_tool_pharmacy.Unique_Id_P} = ${vw_participant_trigger.unique_id} ;;
  }
}

explore: vw_cohort_analysis_summary_1 {
  label: "Cohort Analysis"
}

explore: vw_risk_group_migration {
  label: "Risk Group Migration"
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_risk_group_migration.Unique_id} = ${vw_patient_demographics.unique_id} ;;
  }
  join: patient_diagnosis_summary {
    view_label: "Patient Diagnosis Summary"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_risk_group_migration.Unique_id} = ${patient_diagnosis_summary.PATIENT_ID} AND
      ${vw_risk_group_migration.File_year} = ${patient_diagnosis_summary.reporting_year} ;;
  }
  join: vw_participant_trigger {
    view_label: "Participant Trigger"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_risk_group_migration.Unique_id} = ${vw_participant_trigger.unique_id} ;;
  }
}

explore: vw_risk_group_med_pharma_summary {
  label: "Risk Group - Med & Pharma summary"
}

explore: vw_medication_possession_ratio {
  label: "Medication Possession Ratio"
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_medication_possession_ratio.unique_id} = ${vw_patient_demographics.unique_id} ;;
  }
  join: patient_diagnosis_summary {
    view_label: "Patient Diagnosis Summary"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_medication_possession_ratio.unique_id} = ${patient_diagnosis_summary.PATIENT_ID} AND
      ${vw_medication_possession_ratio.year} = ${patient_diagnosis_summary.reporting_year} ;;
  }
  join: vw_participant_trigger {
    view_label: "Participant Trigger"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_medication_possession_ratio.unique_id} = ${vw_participant_trigger.unique_id} ;;
  }
}

explore: vw_preventive_screening {
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_preventive_screening.unique_id} = ${vw_patient_demographics.unique_id} ;;
  }
  join: patient_diagnosis_summary {
    view_label: "Patient Diagnosis Summary"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_preventive_screening.unique_id} = ${patient_diagnosis_summary.PATIENT_ID} AND
      ${vw_preventive_screening.year} = ${patient_diagnosis_summary.reporting_year} ;;
  }
  label: "Preventive Screening"
  join: vw_participant_trigger {
    view_label: "Participant Trigger"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_preventive_screening.unique_id} = ${vw_participant_trigger.unique_id} ;;
  }
}

explore: hedis_measure {
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${hedis_measure.unique_id} = ${vw_patient_demographics.unique_id} ;;
  }
  join: patient_diagnosis_summary {
    view_label: "Patient Diagnosis Summary"
    type: left_outer
    relationship: many_to_one
    sql_on: ${hedis_measure.unique_id} = ${patient_diagnosis_summary.PATIENT_ID} AND
      ${hedis_measure.year} = ${patient_diagnosis_summary.reporting_year} ;;
  }
  label: "HEDIS Measures"
  join: vw_participant_trigger {
    view_label: "Participant Trigger"
    type: left_outer
    relationship: many_to_one
    sql_on: ${hedis_measure.unique_id} = ${vw_participant_trigger.unique_id} AND
      ${hedis_measure.year} = ${vw_participant_trigger.Plan_Year} ;;

  }
}

explore: ebr_measures {
  label: "EBR Measures"
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${ebr_measures.unique_id} = ${vw_patient_demographics.unique_id} ;;
  }
  join: patient_diagnosis_summary {
    view_label: "Patient Diagnosis Summary"
    type: left_outer
    relationship: many_to_one
    sql_on: ${ebr_measures.unique_id} = ${patient_diagnosis_summary.PATIENT_ID} AND
      ${ebr_measures.year} = ${patient_diagnosis_summary.reporting_year} ;;
  }
  join: vw_participant_trigger {
    view_label: "Participant Trigger"
    type: left_outer
    relationship: many_to_one
    sql_on: ${ebr_measures.unique_id} = ${vw_participant_trigger.unique_id} AND
      ${ebr_measures.year} = ${vw_participant_trigger.Plan_Year} ;;

  }
}

explore: vw_patient_demographics {}

explore: vw_participant_trigger {
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_participant_trigger.unique_id} = ${vw_patient_demographics.unique_id} ;;
  }
}

explore: patient_all_medical_pharmacy_summary { #designed for Claim Analysis summary dashboard.
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${patient_all_medical_pharmacy_summary.PATIENT_ID} = ${vw_patient_demographics.unique_id} ;;
  }
  join: patient_all_medical_summary {
    view_label: "Patient Medical summary"
    type: left_outer
    relationship: many_to_one
    sql_on: ${patient_all_medical_pharmacy_summary.PATIENT_ID} = ${patient_all_medical_summary.PATIENT_ID} ;;
  }
}

explore: patient_all_medical_summary {}

explore:patient_yearly_total_avg_spend_comparison{
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${patient_yearly_total_avg_spend_comparison.patients_id} = ${vw_patient_demographics.unique_id};;
  }
}

explore : vw_vital_alert{
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_vital_alert.unique_id} = ${vw_patient_demographics.unique_id} ;;
  }
}

explore: patient_migration_across_years_summary {
  label: "Patient Yearly Migration summary"
  join: vw_patient_demographics {
    view_label: "Patient Demographics"
    type: left_outer
    relationship: many_to_one
    sql_on: ${patient_migration_across_years_summary.UNIQUE_ID} = ${vw_patient_demographics.unique_id} ;;
  }
}
