defmodule Cloudstate.EventSourced do
  defmacro __using__(_args) do
    quote do
      use Cloudstate.Protocols, [:command, :event, :snapshot, :snapshot_handler]
    end
  end
end
