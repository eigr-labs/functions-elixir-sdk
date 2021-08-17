defmodule Functions.Endpoint do
  @moduledoc false
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)

  services = [
    Functions.EntityDiscovery.Server,
    Functions.Action.Server,
    Functions.CRDT.Server,
    Functions.EventSourced.Server,
    Functions.ValueEntity.Server
  ]

  run(services)
end
