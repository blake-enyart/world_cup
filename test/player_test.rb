require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/player'

class PlayerTest < Minitest::Test

def setup
  @player = Player.new({name: "Luka Modric", position: "midfielder"})
end

def test_player_exist


  assert_instance_of Player, @player
end


def test_player_attr_return_correctly

  assert_equal "Luka Modric", @player.name
  assert_equal "midfielder", @player.position
end
end
