view: ledger_inventory_raw {
  sql_table_name: `rcs-new-script2.ledger.ledger_inventory_raw`
    ;;

  dimension_group: event_dttm {
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
    sql: ${TABLE}.EventDTTM ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.EventType ;;
  }

  dimension: factor {
    type: number
    sql: ${TABLE}.Factor ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
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

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.Store ;;
  }

  dimension: upc {
    type: string
    sql: ${TABLE}.UPC ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.UUID ;;
  }

  measure: count {
    type: count
    drill_fields: [store]
  }

  measure: total_quantity {
    type: sum
    sql: ${qty} ;;
    drill_fields: [store2.state, count]
  }
}
