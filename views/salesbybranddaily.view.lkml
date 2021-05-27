view: salesbybranddaily {
  sql_table_name: `rcs-new-script2.ledger.salesbybranddaily`
    ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
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


  measure: total_quantity {
    type: sum
    sql: ${qty} ;;
  }
}
