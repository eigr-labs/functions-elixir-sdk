defmodule ActionTest do
  use ExUnit.Case

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
    use Eigr.ActionEntity

    def handle_unary(%Ping{name: name} = request) do
      {:reply, %Pong{name: name}}
    end

    def handle_unary(%Pong{} = request),
      do:
        {:reply, %Ping{name: "Pong"},
         %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}}
  end

  test "Unary call" do
    assert ActionEntity.handle_unary(%Ping{name: "Anakin Skywalker"}) ==
             {:reply, %Pong{name: "Anakin Skywalker"}}
  end

  test "Response SideEffects" do
    assert ActionEntity.handle_unary(%Pong{}) ==
             {:reply, %Ping{name: "Pong"},
              %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}}
  end
end
