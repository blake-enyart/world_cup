require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/player'
require './lib/team'
require './lib/world_cup'

class WorldCupTest < Minitest::Test

  def setup
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)

    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_it_exist

    assert_instance_of WorldCup, @world_cup
  end

  def test_active_players_by_position

    assert_equal [@pogba, @modric], @world_cup.active_players_by_position("midfielder")
    @croatia.eliminate = true

    assert_equal [@pogba], @world_cup.active_players_by_position("midfielder")
  end

  def test_all_players_by_position
    expected = {"forward" => [@mbappe], 'midfielder' => [@modric, @pogba], 'defender' => [@vida] }

    assert_equal expected,  @world_cup.all_players_by_position
  end
end
