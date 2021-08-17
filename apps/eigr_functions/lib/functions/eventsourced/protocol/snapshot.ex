defprotocol Functions.EventSourced.Protocol.Snapshot do
  @moduledoc """
  Snapshot are an optimisation for event sourced entities.
  """

  @type payload :: any()

  @spec snapshot(any()) ::
          {:ok, Functions.EventSourced.Context.t()}
          | {:failure, Functions.EventSourced.Context.t(), String.t()}
  def snapshot(context)

  @spec handle_snapshot(any(), payload()) ::
          {:ok, Functions.EventSourced.Context.t()}
          | {:failure, Functions.EventSourced.Context.t(), String.t()}
  def handle_snapshot(context, payload)
end
