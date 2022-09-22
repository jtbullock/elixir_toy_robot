defmodule ToyRobot.Application do
  use Application

  def start( _type, _args ) do
    children = [
      ToyRobot.Game.PlayerSupervisor
    ]

    options = [ strategy: :one_for_one, name: ToyRobot.Supervisor ]

    Supervisor.start_link( children, options )
  end
end
