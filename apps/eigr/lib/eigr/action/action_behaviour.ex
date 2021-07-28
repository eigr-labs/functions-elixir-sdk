defmodule Eigr.Action.Behaviour do
  @moduledoc """
  Behaviour for Action Protocol.
  """

  @type from :: pid()

  @doc """
  Handle a unary command.
  The input command will contain the service name, command name, request metadata and the command
  payload. The reply may contain a direct reply, a forward or a failure, and it may contain many
  side effects.
  """
  @callback handle_unary(any()) ::
              {:reply, any(), [Eigr.SideEffect.t()] | nil}
              | {:forward, any(), [Eigr.SideEffect.t()] | nil}
              | {:failure, String.t()}

  @doc """
  Handle a stream in command.
  """
  @callback handle_streaming(Stream.t()) ::
              {:reply, any(), [Eigr.SideEffect.t()] | nil}
              | {:forward, any(), [Eigr.SideEffect.t()] | nil}
              | {:failure, String.t()}

  @doc """
  Handle a stream out command.
  Using ActionContext.send_reply(from, reply) to send response in a stream
  """
  @callback handle_streamout(any(), from()) :: nil

  @doc """
  Handle a streamed command.
  Using ActionContext.send_reply(from, reply) to send response in a stream
  """
  @callback handle_streamed(Stream.t(), from()) :: nil

  defmodule ActionContext do
    @type from :: pid()

    @spec send_reply(from(), any()) :: nil
    def send_reply(_from, _reply) do
    end
  end
end
