defmodule ToyRobot.Game.PlayerSupervisorTest do
  use ExUnit.Case, async: true

  alias ToyRobot.{ Game.PlayerSupervisor, Robot }

  test "Starts a player child process" do
    robot = %Robot{ north: 0, east: 0, facing: :north }
    { :ok, player } = PlayerSupervisor.start_child( robot, "Izzy" )

    [ { registered_player, _ } ] = Registry.lookup( ToyRobot.Game.PlayerRegistry, "Izzy" )
    assert registered_player == player
  end

  test "Starts a registry" do
    registry = Process.whereis( ToyRobot.Game.PlayerRegistry )
    assert registry
  end

end
