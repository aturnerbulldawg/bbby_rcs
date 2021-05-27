view: state {
  sql_table_name: `rcs-new-script2.ledger.state`
    ;;

  dimension: region {
    drill_fields: [state_name]
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}.StateCode ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.StateName ;;
    drill_fields: [store2.city]
  }

  measure: count {
    type: count
    drill_fields: [state_name]
  }
}
