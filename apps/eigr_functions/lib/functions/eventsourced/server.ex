defmodule Functions.EventSourced.Server do
  use GRPC.Server, service: Cloudstate.Eventsourced.EventSourced.Service
end
