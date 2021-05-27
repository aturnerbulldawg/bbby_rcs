view: upcscenario {
  sql_table_name: `rcs-new-script2.ledger.upcscenario`
    ;;

  dimension: meta {
    type: string
    sql: ${TABLE}.Meta ;;
  }

  dimension: scenario {
    type: string
    sql: ${TABLE}.Scenario ;;
  }

  dimension: upc {
    type: string
    sql: ${TABLE}.UPC ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
