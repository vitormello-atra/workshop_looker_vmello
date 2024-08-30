# The name of this view in Looker is "Itens Pedidos"
view: itens_pedidos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `workshop_gcp_looker.itens_pedidos` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Item Pedido ID" in Explore.

  dimension: item_pedido_id {
    label: "ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.item_pedido_id ;;
  }

  dimension: item_pedido_pedido_id {
    hidden: yes
    type: number
    sql: ${TABLE}.item_pedido_pedido_id ;;
  }

  dimension: item_pedido_produto_id {
    hidden: yes
    type: number
    sql: ${TABLE}.item_pedido_produto_id ;;
  }

  dimension: item_pedido_produto_preco {
    hidden: yes
    type: number
    sql: ${TABLE}.item_pedido_produto_preco ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_item_pedido_produto_preco {
    label: "Preço"
    value_format: "#,##0.00"
    type: sum
    sql: ${TABLE}.item_pedido_produto_preco;;  }

  measure: average_item_pedido_produto_preco {
    label: "Média Preço"
    value_format: "#,##0.00"
    type: average
    sql: ${TABLE}.item_pedido_produto_preco;;  }

  measure: item_pedido_quantidade {
    label: "Quantidade"
    type: sum
    sql: ${TABLE}.item_pedido_quantidade ;;
  }

  measure: item_pedido_subtotal {
    label: "Valor Total"
    value_format: "#,##0.00"
    type: sum
    sql: ${TABLE}.item_pedido_subtotal ;;
  }

  measure: item_pedido_subtotal_yes{
    label: "Valor Total - Pedidos 365d"
    value_format: "#,##0.00"
    type: sum
    sql: ${TABLE}.item_pedido_subtotal;;
    filters: [pedidos.fez_pedido_ultimo_365d : "Yes" ]
  }

  measure: percent_pedido_ultimos_365{
    label: "% Pedido Últimos365d"
    type: number
    value_format_name: percent_2
    sql: 1.0*${item_pedido_subtotal_yes}
      /NULLIF(${item_pedido_subtotal}, 0) ;;
  }

  measure: count {
    type: count
  }
}
