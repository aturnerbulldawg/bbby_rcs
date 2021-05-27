view: salesbycategorydaily {
  sql_table_name: `rcs-new-script2.ledger.salesbycategorydaily`
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.Qty ;;
  }

  dimension_group: window_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Window_Timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }


  filter: date_comparison_filter {
    view_label: "Date Comparison"
    type: date
  }

  parameter: comparison_type {
    view_label: "Date Comparison"
    type: unquoted
    allowed_value: {
      label: "Year"
      value: "year"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
    default_value: "year"
  }

  dimension: selected_comparison {
    view_label: "Date Comparison"
    sql: {% if comparison_type._parameter_value == "year" %}
          ${this_year_vs_last_year}
          {% elsif comparison_type._parameter_value == "week" %}
          ${this_week_vs_last_week}
          {% else %}
          0
          {% endif %};;
  }

  dimension: this_year_vs_last_year {
    view_label: "Date Comparison"
    type: string
    sql: CASE
      WHEN {% condition date_comparison_filter %} ${window_timestamp_raw} {% endcondition %} THEN 'This Year'
      WHEN ${window_timestamp_raw} >= TIMESTAMP(DATE_ADD(CAST({% date_start date_comparison_filter %} AS DATE), INTERVAL -1 YEAR)) AND ${window_timestamp_raw}  < TIMESTAMP(DATE_ADD(CAST({% date_end date_comparison_filter %} AS DATE), INTERVAL -1 YEAR)) THEN 'Prior Year'
    END;;
  }

  dimension: this_week_vs_last_week {
    view_label: "Date Comparison"
    type: string
    sql: CASE
      WHEN {% condition date_comparison_filter %} ${window_timestamp_raw}  {% endcondition %} THEN 'This Week'
      WHEN ${window_timestamp_raw} >= TIMESTAMP(DATE_ADD(CAST({% date_start date_comparison_filter %} AS DATE), INTERVAL -1 WEEK)) AND ${window_timestamp_raw}  < TIMESTAMP(DATE_ADD(CAST({% date_end date_comparison_filter %} AS DATE), INTERVAL -1 WEEK)) THEN 'Prior Week'
    END;;
  }

  measure: total_quantity {
    type: sum
    sql: ${qty} ;;
  }

  measure: sales_change {
    view_label: "Date Comparison"
    label: "Sales Change (%)"
    type: number
    sql: SUM(CASE WHEN ${selected_comparison} LIKE 'This%' THEN ${qty} ELSE NULL END) / NULLIF(SUM(CASE WHEN ${selected_comparison} LIKE 'Prior%' THEN ${qty} ELSE NULL END),0) -1;;
    value_format_name: percent_1
    drill_fields: [transactions.drill_detail*]
  }
}
