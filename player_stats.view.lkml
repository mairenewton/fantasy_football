view: player_stats {
  sql_table_name: public.player_stats ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: catch_tds {
    hidden: yes
    type: number
    sql: ${TABLE}.catch_tds ;;
  }

  dimension: catch_tds_pts {
    hidden: yes
    type: number
    sql: ${catch_tds}*6 ;;
  }

  dimension: catch_yards {
    hidden: yes
    type: number
    sql: ${TABLE}.catch_yards ;;
  }

  dimension: catch_yards_pts {
    hidden: yes
    type: number
    sql: ${catch_yards}/10 ;;
  }

  dimension: catch_pts {
    hidden: yes
    type: number
    sql: ${catch_yards_pts}+${catch_tds_pts} ;;
  }

  dimension: catches {
    hidden: yes
    type: number
    sql: ${TABLE}.catches ;;
  }

  dimension: completions {
    hidden: yes
    type: number
    sql: ${TABLE}.completions ;;
  }

  dimension: fumbles {
    hidden: yes
    type: number
    sql: ${TABLE}.fumbles ;;
  }

  dimension: games_played {
    hidden: yes
    type: number
    sql: ${TABLE}.games_played ;;
  }

  dimension: interceptions {
    hidden: yes
    type: number
    sql: ${TABLE}.interceptions ;;
  }

  dimension: passes {
    hidden: yes
    type: number
    sql: ${TABLE}.passes ;;
  }

  dimension: passing_tds {
    hidden: yes
    type: number
    sql: ${TABLE}.passing_tds ;;
  }

  dimension: passing_td_pts {
    type: number
    sql: ${passing_tds}*4 ;;
  }

  dimension: passing_yards {
    hidden: yes
    type: number
    sql: ${TABLE}.passing_yards ;;
  }

  dimension: passing_yards_pts {
    hidden: yes
    type: number
    sql: ${passing_yards}/25 ;;
  }

  dimension: passing_pts {
    hidden: yes
    type: number
    sql: ${passing_yards_pts}+${passing_td_pts} ;;
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
    hidden: yes
    type: number
    sql: ${TABLE}.rushes ;;
  }

  dimension: rushing_tds {
    hidden: yes
    type: number
    sql: ${TABLE}.rushing_tds ;;
  }

  dimension: rushing_tds_pts {
    hidden: yes
    type: number
    sql: ${rushing_tds}*6 ;;
  }

  dimension: rushing_yards {
    hidden: yes
    type: number
    sql: ${TABLE}.rushing_yards ;;
  }

  dimension: rushing_yards_pts {
    hidden: yes
    type: number
    sql: ${rushing_yards}/10 ;;
  }

  dimension: rushing_pts {
    hidden: yes
    type: number
    sql: ${rushing_yards_pts}+${rushing_tds_pts} ;;
  }

  dimension: targets {
    hidden: yes
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

  measure: years_active {
    hidden: yes
    type: count_distinct
    sql: ${year} ;;
  }

  measure: total_games_played {
    type: sum
    sql: ${games_played} ;;
  }

  measure: perc_games_played {
    type: number
    value_format_name: percent_0
    sql: 1.0*(${total_games_played}/(nullif(${years_active}, 0)*16)) ;;
  }

  measure: total_receiving_tds {
    group_label: "Receiving"
    type: sum
    sql: ${catch_tds} ;;
  }

  measure: total_receiving_yards {
    group_label: "Receiving"
    type: sum
    sql: ${catch_yards} ;;
  }

  measure: total_receptions {
    group_label: "Receiving"
    type: sum
    sql: ${catches} ;;
  }

  measure: total_reception_points {
    group_label: "Receiving"
    type: sum
    sql: ${catch_pts} ;;
  }

  measure: total_targets {
    group_label: "Receiving"
    type: sum
    sql: ${targets} ;;
  }

  measure: average_yards_per_reception {
    group_label: "Receiving"
    type: number
    sql: ${total_receiving_yards}/nullif(${total_receptions}, 0) ;;
    value_format_name: decimal_2
  }

  measure: total_rushing_tds {
    group_label: "Rushing"
    type: sum
    sql: ${rushing_tds} ;;
  }

  measure: total_rushing_yards {
    group_label: "Rushing"
    type: sum
    sql: ${rushing_yards} ;;
  }

  measure: total_rushing_points {
    group_label: "Rushing"
    type: sum
    sql: ${rushing_pts} ;;
  }

  measure: total_rushes {
    group_label: "Rushing"
    type: sum
    sql: ${rushes} ;;
  }

  measure: average_yards_per_carry {
    group_label: "Rushing"
    type: number
    sql: ${total_rushing_yards}/nullif(${total_rushes}, 0) ;;
    value_format_name: decimal_2
  }

  measure: total_passes {
    group_label: "Passing"
    type: sum
    sql: ${passes} ;;
  }

  measure: total_completions {
    group_label: "Passing"
    type: sum
    sql: ${completions} ;;
  }

  measure: total_passing_yards {
    group_label: "Passing"
    type: sum
    sql: ${passing_yards} ;;
  }

  measure: total_passing_tds {
    group_label: "Passing"
    type: sum
    sql: ${passing_tds} ;;
  }

  measure: average_yards_per_completion {
    group_label: "Passing"
    type: number
    sql: ${total_passing_yards}/nullif(${total_completions}, 0) ;;
  }

  measure: total_passing_points {
    group_label: "Passing"
    type: sum
    sql: ${passing_pts} ;;
  }

  measure: total_interceptions {
    group_label: "Turnovers"
    type: sum
    sql: ${interceptions} ;;
  }

  measure: total_fumbles {
    group_label: "Turnovers"
    type: sum
    sql: ${fumbles} ;;
  }

  measure: total_turnovers {
    group_label: "Turnovers"
    type: number
    sql: ${total_interceptions} + ${total_fumbles} ;;
  }

  measure: total_yards {
    type: number
    sql: ${total_passing_yards} + ${total_rushing_yards} + ${total_receiving_yards} ;;
  }

  measure: total_tds {
    type: number
    sql:  ${total_passing_tds} + ${total_rushing_tds} + ${total_receiving_tds}  ;;
  }

  measure: total_points {
    type: number
    sql:  ${total_passing_points} + ${total_rushing_points} + ${total_reception_points}  ;;
  }


  measure: count {
    type: count
    drill_fields: [id, player_first_name, player_last_name]
  }
}
