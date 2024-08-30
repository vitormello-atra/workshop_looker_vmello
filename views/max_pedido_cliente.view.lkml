
view: max_pedido_cliente {
  derived_table: {
    sql: SELECT
      clientes.cliente_cpf as clientes_cliente_cpf,
      MAX(pedidos.pedido_data) AS max_data
      FROM `workshop_gcp_looker.clientes`
      AS clientes
      FULL OUTER JOIN `workshop_gcp_looker.pedidos`
      AS pedidos ON clientes.cliente_cpf=pedidos.cliente_cpf
      GROUP BY
      1
      ORDER BY
      1 ASC ;;
  }

  measure: count {
    hidden:yes
    type: count
    drill_fields: [detail*]
  }

  dimension: clientes_cliente_cpf {
    label: "CPF"
    primary_key: yes
    type: string
    sql: ${TABLE}.clientes_cliente_cpf ;;
  }

  dimension: max_data {
    label: "Último Pedido"
    type: date
    sql: ${TABLE}.max_data ;;
  }

  dimension: dif_dias_pedido {
    type: number
    sql: DATE_DIFF(current_date(), ${max_data}, DAY);;
  }

  set: detail {
    fields: [
        clientes_cliente_cpf,
  max_data
    ]
  }
}
