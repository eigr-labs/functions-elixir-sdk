defmodule Eigr.ActionEntity do
  @spec __using__(any) ::
          {:@, [{:context, Eigr.ActionEntity} | {:import, Kernel}, ...],
           [{:behaviour, [...], [...]}, ...]}
  defmacro __using__(_args) do
    quote do
      @behaviour Eigr.Action.Behaviour
    end
  end
end
