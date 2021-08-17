defmodule Functions.ValueEntity.Server do
  use GRPC.Server, service: Cloudstate.Valueentity.ValueEntity.Service
end
