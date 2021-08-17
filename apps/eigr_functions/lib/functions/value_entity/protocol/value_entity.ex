defprotocol Functions.ValueEntity.Protocol do
  @moduledoc """

  """

  @type command :: any()
  @type response_to_caller :: any()
  @type context :: Functions.ValueEntity.Context.t()
  @type new_ctx_state :: Functions.ValueEntity.Context.t()

  @spec handle_command(context(), command()) ::
          {:ok, new_ctx_state(), response_to_caller(), [Functions.SideEffect.t()] | nil}
          | {:update, new_ctx_state(), response_to_caller(), [Functions.SideEffect.t()] | nil}
          | {:delete, new_ctx_state(), response_to_caller(), [Functions.SideEffect.t()] | nil}
          | {:failure, context(), String.t()}
  def handle_command(context, command)
end
