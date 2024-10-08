# The name of this view in Looker is "Clientes"
view: clientes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `workshop_gcp_looker.clientes` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cliente Cep" in Explore.

  dimension: cliente_cep {
    label: "CEP"
    type: string
    sql: ${TABLE}.cliente_cep ;;
  }

  dimension: cliente_cidade {
    label: "Cidade"
    type: string
    sql: ${TABLE}.cliente_cidade ;;
  }

  dimension: cliente_cpf {
    label: "CPF"
    primary_key: yes
    type: string
    sql: ${TABLE}.cliente_cpf ;;
  }

  dimension: cliente_email {
    label: "E-mail"
    type: string
    sql: ${TABLE}.cliente_email ;;
  }

  dimension: cliente_endereco {
    label: "Endereço"
    type: string
    sql: ${TABLE}.cliente_endereco ;;
  }

  dimension: cliente_estado {
    label: "Estado"
    type: string
    sql: ${TABLE}.cliente_estado ;;
  }

  dimension: cliente_nome {
    label: "Nome"
    type: string
    sql: ${TABLE}.cliente_nome ;;
  }

  dimension: cliente_pais {
    label: "País"
    type: string
    sql: ${TABLE}.cliente_pais ;;
  }

  dimension: cliente_telefone {
    label: "Telefone"
    type: string
    sql: ${TABLE}.cliente_telefone ;;
  }
  measure: count {
    type: count
    drill_fields: [cliente_cpf]
  }
}
