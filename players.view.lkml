view: players {
  sql_table_name: public.players ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bye_week {
    type: string
    sql: ${TABLE}.bye_week ;;
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

  dimension: position {
    type: string
    sql: ${TABLE}.position ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  measure: count {
    type: count
    drill_fields: [id, player_first_name, player_last_name]
  }
}
