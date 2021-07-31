defmodule ActionTest do
  use ExUnit.Case

  test "Unary call" do
    test_action = %ActionEntity{context: %{}}

    assert {:reply, %Pong{name: "Anakin Skywalker"}} =
             Eigr.Action.handle_unary(test_action, %Ping{name: "Anakin Skywalker"})
  end

  test "Response SideEffects" do
    test_action = %ActionEntity{context: %{}}

    assert {:reply, %Ping{name: "Pong"},
            %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}} =
             Eigr.Action.handle_unary(test_action, %Pong{})
  end
end
