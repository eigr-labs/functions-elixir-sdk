defprotocol Permastate.Action.Protocol.StreamOut do
  @moduledoc """
  Behaviour for Action Protocol.
  """
  @fallback_to_any true
  @type from :: pid()

  @doc """
  Handle a stream out command.
  Using Permastate.Action.Context.send_reply(from, reply) to send response in a stream
  """
  @spec handle_stream_out(any(), any(), from()) :: nil
  def handle_stream_out(action, request, from)
end
