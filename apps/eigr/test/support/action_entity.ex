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

defmodule ActionEntity do
  use Eigr.Action

  def handle_unary(%Ping{name: name} = request) do
    {:reply, %Pong{name: name}}
  end

  def handle_unary(%Pong{} = request),
    do:
      {:reply, %Ping{name: "Pong"},
       %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}}
end
