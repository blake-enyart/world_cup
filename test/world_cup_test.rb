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

    @croatia = 
  end

  def test_it_exist

    assert_instance_of WorldCup, @world_cup
  end
end
