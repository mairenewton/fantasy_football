view: injury_suspension {
  sql_table_name: public.injury_suspension ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_injured {
    type: string
    sql: ${TABLE}.is_injured ;;
  }

  dimension: is_suspended {
    type: string
    sql: ${TABLE}.is_suspended ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: player_first_name {
    type: string
    sql: ${TABLE}.player_first_name ;;
  }

  dimension: player_last_name {
    type: string
    sql: ${TABLE}.player_last_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, player_first_name, player_last_name]
  }
}
