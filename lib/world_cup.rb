class WorldCup

  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    play_pos = []
    @teams.map do |team|
      if !team.eliminated?
        play_pos << team.players_by_position(position)
      end
    end
    play_pos.flatten!
  end

  def all_players_by_position
    all_players = @teams.map { |team| team.players }.flatten
    hash_players = all_players.group_by { |player| player.position }
    hash_players.each_value { |player_list| player_list.sort_by!(&:name) }
  end
end
