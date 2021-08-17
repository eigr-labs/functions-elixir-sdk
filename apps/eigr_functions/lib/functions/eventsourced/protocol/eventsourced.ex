defprotocol Functions.EventSourced.Protocol do
  @moduledoc """

  """

  @type command :: any()
  @type event :: any()

  @spec handle_command(any(), command()) ::
          {:reply, Functions.EventSourced.Context.t(), any(), [Functions.SideEffect.t()] | nil}
          | {:forward, Functions.EventSourced.Context.t(), any(),
             [Functions.SideEffect.t()] | nil}
          | {:failure, Functions.EventSourced.Context.t(), String.t()}
  def handle_command(context, command)

  @spec handle_event(any(), event()) ::
          {:ok, Functions.EventSourced.Context.t()}
          | {:failure, Functions.EventSourced.Context.t(), String.t()}
  def handle_event(context, event)
end
