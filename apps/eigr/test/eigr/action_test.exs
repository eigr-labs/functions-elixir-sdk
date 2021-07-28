defmodule ActionTest do
  use ExUnit.Case

  test "Unary call" do
    assert {:reply, %Pong{name: "Anakin Skywalker"}} =
             ActionEntity.handle_unary(%Ping{name: "Anakin Skywalker"})
  end

  test "Response SideEffects" do
    assert {:reply, %Ping{name: "Pong"},
            %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}} =
             ActionEntity.handle_unary(%Pong{})
  end
end
