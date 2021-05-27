- dashboard: rcs_demo__group_overview
  title: RCS Demo - Group Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: Today
    body_text: ''
    row: 3
    col: 14
    width: 10
    height: 2
  - title: Inventory Events
    name: Inventory Events
    model: rcsdemo
    explore: ledger_inventory_raw
    type: single_value
    fields: [ledger_inventory_raw.count, ledger_inventory_raw.event_dttm_date]
    fill_fields: [ledger_inventory_raw.event_dttm_date]
    filters:
      ledger_inventory_raw.event_dttm_date: 2 days
    sorts: [ledger_inventory_raw.event_dttm_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: vs_yesterday, label: vs. Yesterday, expression: 'offset(${ledger_inventory_raw.count},1)',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    refresh: 10 seconds
    listen: {}
    row: 5
    col: 19
    width: 5
    height: 6
  - title: Sales Events
    name: Sales Events
    model: rcsdemo
    explore: ledger_sales_raw
    type: single_value
    fields: [ledger_sales_raw.count, ledger_sales_raw.timestamp_date]
    fill_fields: [ledger_sales_raw.timestamp_date]
    filters:
      ledger_sales_raw.timestamp_date: 2 days
    sorts: [ledger_sales_raw.timestamp_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: vs_yesterday, label: vs. Yesterday, expression: 'offset(${ledger_sales_raw.count},1)',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    refresh: 10 seconds
    listen: {}
    row: 5
    col: 14
    width: 5
    height: 6
  - title: Today's Events by Location
    name: Today's Events by Location
    model: rcsdemo
    explore: ledger_inventory_raw
    type: looker_map
    fields: [ledger_inventory_raw.count, ledger_inventory_raw.location]
    filters:
      ledger_inventory_raw.event_dttm_date: today
    sorts: [ledger_inventory_raw.count desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 11
    col: 14
    width: 10
    height: 11
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: Summary
    body_text: ''
    row: 3
    col: 0
    width: 14
    height: 2
  - title: Sales by Region
    name: Sales by Region
    model: rcsdemo
    explore: ledger_sales_raw
    type: looker_pie
    fields: [state.region, ledger_sales_raw.total_quantity]
    sorts: [ledger_sales_raw.total_quantity desc]
    limit: 500
    value_labels: labels
    label_type: labVal
    inner_radius: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Summary Date: ledger_sales_raw.timestamp_date
    row: 5
    col: 0
    width: 7
    height: 6
  - title: Sales by Department
    name: Sales by Department
    model: rcsdemo
    explore: ledger_sales_raw
    type: looker_bar
    fields: [skuupc.department, ledger_sales_raw.total_quantity]
    pivots: [skuupc.department]
    filters:
      skuupc.department: "-NULL"
    sorts: [ledger_sales_raw.total_quantity desc 0, skuupc.department]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Summary Date: ledger_sales_raw.timestamp_date
    row: 5
    col: 7
    width: 7
    height: 6
  - name: "<span class='fa fa-random'> Top movers</span>"
    type: text
    title_text: "<span class='fa fa-random'> Top movers</span>"
    subtitle_text: ''
    body_text: |-
      <center><strong>Recommended Action</strong>
      Text/email store managers of underperforming stores to look into their store, or dive into the store performance.</center>
    row: 22
    col: 0
    width: 24
    height: 3
  - name: Company Overview
    type: text
    title_text: Company Overview
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 6
    width: 12
    height: 3
  - title: Movers by Region
    name: Movers by Region
    model: rcsdemo
    explore: salesbystoredaily
    type: looker_bar
    fields: [salesbystoredaily.sales_change, state.region]
    filters:
      salesbystoredaily.comparison_type: year
    sorts: [salesbystoredaily.sales_change desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Summary Date: salesbystoredaily.date_comparison_filter
    row: 25
    col: 0
    width: 12
    height: 12
  - title: Movers by Category
    name: Movers by Category
    model: rcsdemo
    explore: salesbycategorydaily
    type: looker_bar
    fields: [salesbycategorydaily.category, salesbycategorydaily.sales_change]
    filters:
      salesbycategorydaily.comparison_type: year
    sorts: [salesbycategorydaily.sales_change desc]
    limit: 10
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Summary Date: salesbycategorydaily.date_comparison_filter
    row: 25
    col: 12
    width: 12
    height: 12
  - title: Top 10 Brands by Revenue
    name: Top 10 Brands by Revenue
    model: rcsdemo
    explore: salesbybrandrevenuedaily
    type: looker_column
    fields: [salesbybrandrevenuedaily.total_revenue, salesbybranddaily.total_quantity,
      salesbybrandrevenuedaily.brand]
    sorts: [salesbybrandrevenuedaily.total_revenue desc]
    limit: 10
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: salesbybrandrevenuedaily.total_revenue,
            id: salesbybrandrevenuedaily.total_revenue, name: Total Revenue}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: salesbybranddaily.total_quantity,
            id: salesbybranddaily.total_quantity, name: Total Quantity}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: salesbybranddaily.total_quantity
    series_types:
      salesbybranddaily.total_quantity: scatter
    defaults_version: 1
    listen:
      Summary Date: salesbybrandrevenuedaily.window_timestamp_date
    row: 11
    col: 0
    width: 14
    height: 11
  - title: Seasonality
    name: Seasonality
    model: rcsdemo
    explore: ledger_sales_raw
    type: looker_line
    fields: [ledger_sales_raw.timestamp_month_name, ledger_sales_raw.total_quantity,
      skuupc.category]
    pivots: [skuupc.category]
    fill_fields: [ledger_sales_raw.timestamp_month_name]
    filters:
      skuupc.category: Swim,Outerwear & Coats,Fashion Hoodies & Sweatshirts,Accessories,Active,Jeans
    sorts: [skuupc.category 0, ledger_sales_raw.timestamp_month_name]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_series: [skuupc.category___null - ledger_sales_raw.total_quantity]
    listen: {}
    row: 37
    col: 0
    width: 24
    height: 11
  filters:
  - name: Summary Date
    title: Timestamp Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: rcsdemo
    explore: ledger_sales_raw
    listens_to_filters: []
    field: ledger_sales_raw.timestamp_date
