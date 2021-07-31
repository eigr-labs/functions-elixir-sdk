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

defmodule ActionEntityUnaryTest do
  use Eigr.Action.Entity

  defimpl Eigr.Action.Unary do
    def handle_unary(context, %Ping{name: name} = request) do
      {:reply, %Pong{name: name}}
    end

    def handle_unary(context, %Pong{} = request),
      do:
        {:reply, %Ping{name: "Pong"},
         %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}}
  end
end
