defprotocol Eigr.Action do
  @moduledoc """
  Behaviour for Action Protocol.
  """
  @fallback_to_any true
  @type from :: pid()

  @doc """
  Handle a unary command.
  The input command will contain the service name, command name, request metadata and the command
  payload. The reply may contain a direct reply, a forward or a failure, and it may contain many
  side effects.
  """
  @spec handle_unary(any(), any()) ::
          {:reply, any(), [Eigr.SideEffect.t()] | nil}
          | {:forward, any(), [Eigr.SideEffect.t()] | nil}
          | {:failure, String.t()}
  def handle_unary(action, request)

  @doc """
  Handle a stream in command.
  """
  @spec handle_streaming(any(), Stream.t()) ::
          {:reply, any(), [Eigr.SideEffect.t()] | nil}
          | {:forward, any(), [Eigr.SideEffect.t()] | nil}
          | {:failure, String.t()}
  def handle_streaming(action, stream)

  @doc """
  Handle a stream out command.
  Using ActionContext.send_reply(from, reply) to send response in a stream
  """
  @spec handle_streamout(any(), any(), from()) :: nil
  def handle_streamout(action, request, from)

  @doc """
  Handle a streamed command.
  Using ActionContext.send_reply(from, reply) to send response in a stream
  """
  @spec handle_streamed(any(), Stream.t(), from()) :: nil
  def handle_streamed(action, stream, from)
end
