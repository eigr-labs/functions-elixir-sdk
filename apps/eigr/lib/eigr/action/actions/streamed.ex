defprotocol Eigr.Action.Streamed do
  @moduledoc """
  Behaviour for Action Protocol.
  """
  @fallback_to_any true
  @type from :: pid()

  @doc """
  Handle a streamed command.
  Using ActionContext.send_reply(from, reply) to send response in a stream
  """
  @spec handle_streamed(any(), Stream.t(), from()) :: nil
  def handle_streamed(action, stream, from)
end
