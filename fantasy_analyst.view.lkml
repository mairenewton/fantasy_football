view: fantasy_analyst {
  sql_table_name: public.fantasy_analyst ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: analyst_name {
    type: string
    sql: ${TABLE}.analyst_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, analyst_name]
  }
}
