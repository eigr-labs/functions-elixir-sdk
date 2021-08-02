defprotocol Permastate.EventSourced.Protocol do
  @moduledoc """

  """

  @type command :: any()
  @type event :: any()

  @spec handle_command(any(), command()) ::
          {:reply, Permastate.EventSourced.Context.t(), any(), [Permastate.SideEffect.t()] | nil}
          | {:forward, Permastate.EventSourced.Context.t(), any(),
             [Permastate.SideEffect.t()] | nil}
          | {:failure, Permastate.EventSourced.Context.t(), String.t()}
  def handle_command(context, command)

  @spec handle_event(any(), event()) ::
          {:ok, Permastate.EventSourced.Context.t()}
          | {:failure, Permastate.EventSourced.Context.t(), String.t()}
  def handle_event(context, event)
end
