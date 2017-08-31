connection: "fantasy_football"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: fantasy_rankings {
  join: players {
    type: left_outer
    sql_on: ${fantasy_rankings.player_first_name} = ${players.player_first_name}
      AND ${fantasy_rankings.player_last_name} = ${players.player_last_name};;
    relationship: many_to_one
  }
  join: fantasy_analyst {
    type: inner
    sql_on: ${fantasy_rankings.ranker_name_id} = ${fantasy_analyst.id} ;;
    relationship: many_to_one
  }
  join: sources {
    type: inner
    sql_on: ${fantasy_rankings.rank_source_id} = ${sources.id} ;;
    relationship: one_to_many
  }
#   join: player_stats {
#     type: left_outer
#     sql_on: ${fantasy_rankings.player_first_name} = ${player_stats.player_first_name}
#       AND ${fantasy_rankings.player_last_name} = ${player_stats.player_last_name};;
#     relationship: many_to_many
#   }

  join: injury_suspension {
    type: left_outer
    sql_on: ${fantasy_rankings.player_first_name} = ${injury_suspension.player_first_name}
      AND ${fantasy_rankings.player_last_name} = ${injury_suspension.player_last_name};;
    relationship: many_to_one
  }
}

explore: player_stats {
  join: players {
    type: left_outer
    sql_on: ${player_stats.player_first_name} = ${players.player_first_name}
      AND ${player_stats.player_last_name} = ${players.player_last_name};;
    relationship: many_to_one
  }
}
