defmodule Functions.CRDT.Server do
  use GRPC.Server, service: Cloudstate.Crdt.Crdt.Service
end
