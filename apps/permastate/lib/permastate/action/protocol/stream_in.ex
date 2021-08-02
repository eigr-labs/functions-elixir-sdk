defprotocol Permastate.Action.Protocol.StreamIn do
  @moduledoc """
  Behaviour for Action Protocol.
  """
  @fallback_to_any true

  @doc """
  Handle a stream in command.
  """
  @spec handle_stream_in(any(), Stream.t()) ::
          {:reply, any(), [Permastate.SideEffect.t()] | nil}
          | {:forward, any(), [Permastate.SideEffect.t()] | nil}
          | {:failure, String.t()}
  def handle_stream_in(action, stream)
end
