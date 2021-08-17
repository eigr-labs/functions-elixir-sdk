defprotocol Functions.Action.Protocol.Unary do
  @moduledoc """
  Behaviour for Action Protocol.
  """
  @fallback_to_any true

  @doc """
  Handle a unary command.
  The input command will contain the service name, command name, request metadata and the command
  payload. The reply may contain a direct reply, a forward or a failure, and it may contain many
  side effects.
  """
  @spec handle_unary(any(), any()) ::
          {:reply, any(), [Functions.SideEffect.t()] | nil}
          | {:forward, any(), [Functions.SideEffect.t()] | nil}
          | {:failure, String.t()}
  def handle_unary(action, request)
end
