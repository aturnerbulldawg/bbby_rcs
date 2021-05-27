view: store2 {
  sql_table_name: `rcs-new-script2.ledger.store2`
    ;;

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
#     link: {
#       url: "/dashboards/WQKf302aPo8IEFvc2EkSQP?Date={{ _filters['transactions.date_comparison_filter'] | url_encode }}&Store={{value | encode_uri}}"
#       label: "Drill down into {{rendered_value}}"
#     }
    link: {
      url: "https://looker-retail-demo-1.appspot.com/api/contactStoreManager?store={{value | encode_uri}}"
      label: "Text/Call {{rendered_value}} Store Manager via Google App Engine"
      icon_url: "https://cdn.iconscout.com/icon/free/png-256/twilio-282195.png"
    }
  }

  dimension: in_transit_days {
    type: number
    sql: ${TABLE}.InTransitDays ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: location_type_cd {
    type: string
    sql: ${TABLE}.LocationTypeCD ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.Population ;;
  }

  dimension: receiving_day_of_week {
    type: number
    sql: ${TABLE}.ReceivingDayOfWeek ;;
  }

  dimension: square_feet {
    type: number
    sql: ${TABLE}.SquareFeet ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
    drill_fields: [zip]
    map_layer_name: us_states
  }

  dimension: store_number {
    type: number
    sql: CAST(${TABLE}.StoreNumber as INT64) ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.Zip ;;
    drill_fields: [city]
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
