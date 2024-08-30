# If necessary, uncomment the line below to include explore_source.

# include: "workshop_looker_vmello.model.lkml"

view: pedido_cliente {
  derived_table: {
    explore_source: clientes {
      column: cliente_nome {}
      column: cliente_cpf {}
      column: data_date { field: pedidos.data_date }
      column: item_pedido_subtotal { field: itens_pedidos.item_pedido_subtotal }
    }
    datagroup_trigger: workshop_looker_vmello_default_datagroup
  }
  dimension: cliente_nome {
    label: "Clientes Nome"
    description: ""
  }
  dimension: cliente_cpf {
    primary_key: yes
    label: "Clientes CPF"
    description: ""
  }
  dimension: data_date {
    label: "Pedidos Data"
    description: ""
    type: date
  }
  dimension: item_pedido_subtotal {
    label: "Itens Pedidos Valor Total"
    description: ""
    value_format: "#,##0.00"
    type: number
  }
}
