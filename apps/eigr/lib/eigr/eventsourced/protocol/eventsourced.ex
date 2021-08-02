defprotocol Eigr.EventSourced.Protocol do
  @moduledoc """

  """

  @type command :: any()
  @type event :: any()

  @spec handle_command(any(), command()) ::
          {:reply, Eigr.EventSourced.Context.t(), any(), [Eigr.SideEffect.t()] | nil}
          | {:forward, Eigr.EventSourced.Context.t(), any(), [Eigr.SideEffect.t()] | nil}
          | {:failure, Eigr.EventSourced.Context.t(), String.t()}
  def handle_command(context, command)

  @spec handle_event(any(), event()) ::
          {:ok, Eigr.EventSourced.Context.t()}
          | {:failure, Eigr.EventSourced.Context.t(), String.t()}
  def handle_event(context, event)
end
