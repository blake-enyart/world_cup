class Team

  attr_reader :country,
              :players

  attr_accessor :eliminate

  def initialize(country)
    @country = country
    @eliminate = false
    @players = []
  end

  def eliminated?
    @eliminate
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    @players.select { |player| player.position == position  }
  end
end
