defprotocol Eigr.EventSourced.Protocol.Snapshot do
  @moduledoc """
  Snapshot are an optimisation for event sourced entities.
  """

  @type payload :: any()

  @spec snapshot(any()) ::
          {:ok, Eigr.EventSourced.Context.t()}
          | {:failure, Eigr.EventSourced.Context.t(), String.t()}
  def snapshot(context)

  @spec handle_snapshot(any(), payload()) ::
          {:ok, Eigr.EventSourced.Context.t()}
          | {:failure, Eigr.EventSourced.Context.t(), String.t()}
  def handle_snapshot(context, payload)
end
