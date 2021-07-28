defmodule Eigr.Grpc.Endpoint do
  @moduledoc false
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)

  services = [
    Eigr.EntityDiscovery.Server,
    Eigr.Action.Server,
    Eigr.CRDT.Server,
    Eigr.EventSourced.Server,
    Eigr.ValueEntity.Server
  ]

  run(services)
end
