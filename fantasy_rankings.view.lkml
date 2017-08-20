view: fantasy_rankings {
  sql_table_name: public.fantasy_rankings ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: player_first_name {
    type: string
    sql: ${TABLE}.player_first_name ;;
  }

  dimension: player_last_name {
    type: string
    sql: ${TABLE}.player_last_name ;;
  }

  dimension: player_name {
    type: string
    sql: ${player_first_name} || ' ' || ${player_last_name} ;;
  }

  dimension: ppr {
    type: yesno
    sql: ${TABLE}.ppr ;;
  }

  dimension: rank_source_id {
    type: string
    sql: ${TABLE}.rank_source_id ;;
  }

  dimension: ranker_name_id {
    type: string
    sql: ${TABLE}.ranker_name_id ;;
  }

  dimension: ranking {
    type: number
    sql: ${TABLE}.ranking ;;
  }

  measure: average_ranking {
    type: average
    sql: ${ranking} ;;
    value_format_name: decimal_2
  }

  measure: average_draft_pick {
    type: number
    sql: floor(${average_ranking}) ;;
    value_format_name: decimal_1
  }

  measure: min_draft_pick {
    type: min
    sql: ${ranking} ;;
  }

  measure: max_draft_pick {
    type: max
    sql: ${ranking} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, player_last_name, player_first_name]
  }
}
