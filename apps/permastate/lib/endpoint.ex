defmodule Permastate.Endpoint do
  @moduledoc false
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)

  services = [
    Permastate.EntityDiscovery.Server,
    Permastate.Action.Server,
    Permastate.CRDT.Server,
    Permastate.EventSourced.Server,
    Permastate.ValueEntity.Server
  ]

  run(services)
end
