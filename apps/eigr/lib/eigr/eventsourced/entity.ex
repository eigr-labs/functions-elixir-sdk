defmodule Eigr.EventSourced.Entity do
  @moduledoc """
  EntryPoint for Action entities.
  """
  defmacro __using__(_args) do
    quote do
      defstruct [
        :context
      ]

      def new(opts \\ []) do
        %__MODULE__{
          context: Keyword.get(opts, :context, %EventSourcedContext{})
        }
      end
    end
  end
end
