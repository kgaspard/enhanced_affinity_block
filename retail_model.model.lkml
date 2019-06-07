#### TO DO: Replace with your connection name
connection: "snowlooker"

include: "*.view.lkml"                       # include all views in this project
include: "*.dashboard.lookml"                       # include all dashboards in this project

#### TO DO: If persisting the order_items_base view, edit this datagroup to the frequency at which you want to persist the view
datagroup: daily {
  sql_trigger: SELECT 1 ;;
  max_cache_age: "24 hours"
}

#### TO DO: Replace with your currency format
named_value_format: curr {
  value_format: "#,##0.00 \" USD\""
}
named_value_format: curr_0 {
  value_format: "#,##0 \" USD\""
}

explore: order_purchase_affinity {
  label: "🔗 Item Affinity"
  view_label: "Item Affinity"

  always_filter: {
    filters: {
      field: affinity_timeframe
      value: "last 90 days"
    }
    filters: {
      field: order_items_base.product_level
      #### TO DO: Replace with your most used hierarchy level (defined in the affinity_analysis view)
      value: "SKU"
    }
  }

  join: order_items_base {}

  join: total_orders {
    type: cross
    relationship: many_to_one
  }



}
