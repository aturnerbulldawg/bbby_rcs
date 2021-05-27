view: ledger_sales_raw {
  sql_table_name: `rcs-new-script2.ledger.ledger_sales_raw`
    ;;

  dimension: factor {
    type: number
    sql: ${TABLE}.Factor ;;
  }

  dimension: location {
    type: number
    sql: ${TABLE}.Location ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.Qty ;;
  }

  dimension: scenario {
    type: string
    sql: ${TABLE}.Scenario ;;
  }

  dimension: shard_id {
    type: number
    sql: ${TABLE}.ShardId ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_name
    ]
    sql: CAST(${TABLE}.Timestamp as timestamp) ;;
  }

  dimension: upc {
    type: string
    sql: CAST(${TABLE}.UPC as string) ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.UUID ;;
  }

  measure: count {
    type: count
    drill_fields: [store2.state, count]
  }


  measure: total_quantity {
    type: sum
    sql: ${qty} ;;
    drill_fields: [store2.state, count]
  }

}
