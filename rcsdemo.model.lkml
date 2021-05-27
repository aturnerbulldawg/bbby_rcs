connection: "rcs"
persist_for: "30 minutes"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
include: "rcs_overview.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: ledger_inventory_raw {
  sql_always_where: ${event_dttm_raw} < CURRENT_TIMESTAMP() ;;
  join: store2 {
    relationship: many_to_one
    type: left_outer
    sql_on: ${ledger_inventory_raw.store} = ${store2.store_number} ;;
  }
  join: state {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store2.state} = ${state.state_name} ;;
  }
  join: skuupc {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ledger_inventory_raw.upc} = ${skuupc.upc} ;;
  }
}

explore: ledger_sales_raw {
  sql_always_where: ${timestamp_raw} < CURRENT_TIMESTAMP() ;;
  join: store2 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ledger_sales_raw.location} = ${store2.store_number} ;;
  }
  join: state {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store2.state} = ${state.state_name} ;;
  }
  join: skuupc {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ledger_sales_raw.upc} = ${skuupc.upc} ;;
  }
}

explore: salesbystoredaily {
  join: store2 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${salesbystoredaily.store} = ${store2.store_number} ;;
  }
  join: state {
    type: left_outer
    relationship: many_to_one
    sql_on: ${store2.state} = ${state.state_name} ;;
  }
}

explore: salesbycategorydaily {}

explore: salesbybrandrevenuedaily {
  join: salesbybranddaily {
    relationship: one_to_one
    type: left_outer
    sql_on: ${salesbybranddaily.window_timestamp_date} = ${salesbybrandrevenuedaily.window_timestamp_date}
    AND  ${salesbybranddaily.brand} = ${salesbybrandrevenuedaily.brand};;
  }
}
