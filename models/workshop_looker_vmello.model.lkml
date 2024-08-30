# Define the database connection to be used for this model.
connection: "workshop_looker_atra_bq"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: workshop_looker_vmello_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "12 hour"
  interval_trigger: "24 hour"
}

persist_with: workshop_looker_vmello_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Workshop Looker Vmello"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

label: "Vendas_vmello"
explore: clientes {
  label: "Pedidos"
  join: pedidos {
    type: full_outer
    sql_on: ${clientes.cliente_cpf}=${pedidos.cliente_cpf} ;;
    relationship: one_to_many
  }

  join: itens_pedidos {
    type: full_outer
    sql_on: ${pedidos.pedido_id}=${itens_pedidos.item_pedido_pedido_id};;
    relationship: one_to_many
  }

  join: produtos {
    type: full_outer
    sql_on: ${produtos.produto_id}=${itens_pedidos.item_pedido_produto_id} ;;
    relationship: one_to_many
  }

  join: max_pedido_cliente {
    type: full_outer
    sql_on: ${clientes.cliente_cpf}=${max_pedido_cliente.clientes_cliente_cpf} ;;
    relationship: one_to_many
  }

  join: pedido_cliente {
    type: full_outer
    sql_on: ${clientes.cliente_cpf}=${pedido_cliente.cliente_cpf} ;;
    relationship: one_to_many
  }
}
