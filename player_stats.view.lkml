view: player_stats {
  sql_table_name: public.player_stats ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: catch_tds {
    type: number
    sql: ${TABLE}.catch_tds ;;
  }

  dimension: catch_yards {
    type: number
    sql: ${TABLE}.catch_yards ;;
  }

  dimension: catches {
    type: number
    sql: ${TABLE}.catches ;;
  }

  dimension: completions {
    type: number
    sql: ${TABLE}.completions ;;
  }

  dimension: fumbles {
    type: number
    sql: ${TABLE}.fumbles ;;
  }

  dimension: games_played {
    type: number
    sql: ${TABLE}.games_played ;;
  }

  dimension: interceptions {
    type: number
    sql: ${TABLE}.interceptions ;;
  }

  dimension: passes {
    type: number
    sql: ${TABLE}.passes ;;
  }

  dimension: passing_tds {
    type: number
    sql: ${TABLE}.passing_tds ;;
  }

  dimension: passing_yards {
    type: number
    sql: ${TABLE}.passing_yards ;;
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

  dimension: rushes {
    type: number
    sql: ${TABLE}.rushes ;;
  }

  dimension: rushing_tds {
    type: number
    sql: ${TABLE}.rushing_tds ;;
  }

  dimension: rushing_yards {
    type: number
    sql: ${TABLE}.rushing_yards ;;
  }

  dimension: targets {
    type: number
    sql: ${TABLE}.targets ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [id, player_first_name, player_last_name]
  }
}
