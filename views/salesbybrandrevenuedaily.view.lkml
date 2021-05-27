view: salesbybrandrevenuedaily {
  sql_table_name: `rcs-new-script2.ledger.salesbybrandrevenuedaily`
    ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.Revenue ;;
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

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
  }
}
