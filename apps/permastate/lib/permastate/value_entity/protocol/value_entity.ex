defprotocol Permastate.ValueEntity.Protocol do
  @moduledoc """

  """

  @type command :: any()
  @type response_to_caller :: any()
  @type context :: Permastate.ValueEntity.Context.t()
  @type new_ctx_state :: Permastate.ValueEntity.Context.t()

  @spec handle_command(context(), command()) ::
          {:ok, new_ctx_state(), response_to_caller(), [Permastate.SideEffect.t()] | nil}
          | {:update, new_ctx_state(), response_to_caller(), [Permastate.SideEffect.t()] | nil}
          | {:delete, new_ctx_state(), response_to_caller(), [Permastate.SideEffect.t()] | nil}
          | {:failure, context(), String.t()}
  def handle_command(context, command)
end
