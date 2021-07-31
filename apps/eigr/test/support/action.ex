defmodule Ping do
  defstruct [
    :name
  ]

  @type t() :: %__MODULE__{
          name: String.t()
        }
end

defmodule Pong do
  defstruct [
    :name
  ]

  @type t() :: %__MODULE__{
          name: String.t()
        }
end

defmodule ActionEntityTest do
  use Eigr.ActionEntity

  defimpl Eigr.Action do
    def handle_unary(context, %Ping{name: name} = request) do
      {:reply, %Pong{name: name}}
    end

    def handle_unary(context, %Pong{} = request),
      do:
        {:reply, %Ping{name: "Pong"},
         %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}}
  end
end
