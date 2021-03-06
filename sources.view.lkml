view: sources {
  sql_table_name: public.sources ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: source_name {
    type: string
    sql: ${TABLE}.source_name ;;
  }

  measure: number_of_analysts{
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, source_name]
  }
}
