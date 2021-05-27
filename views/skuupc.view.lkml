view: skuupc {
  sql_table_name: `rcs-new-script2.ledger.skuupc`
    ;;

  dimension: average_daily {
    type: number
    sql: ${TABLE}.AverageDaily ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
    drill_fields: [name]
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
    drill_fields: [brand]
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
    drill_fields: [category]
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.RetailPrice ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: upc {
    type: string
    sql: ${TABLE}.UPC ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
