require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test

  def setup
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  def test_it_exist

    assert_instance_of Team, @team
  end

  def test_team_attr_store_correctly

    assert_equal "France", @team.country
  end

  def test_team_eliminate_writes_correctly

    assert_equal false, @team.eliminated?
    @team.eliminate = true

    assert_equal true, @team.eliminated?
  end

  def test_add_player_adds_to_players_list
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    assert_equal [@mbappe, @pogba], @team.players
  end

  def test_choose_players_by_position
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [@mbappe], @team.players_by_position("forward")
    assert_equal [], @team.players_by_position("defender")
  end


end
