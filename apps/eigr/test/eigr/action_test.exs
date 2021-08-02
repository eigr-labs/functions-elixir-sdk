defmodule ActionTest do
  use ExUnit.Case

  test "simple unary call" do
    unary_action = ActionEntityUnaryTest.new(context: %{})

    assert {:reply, %Pong{name: "Anakin Skywalker"}} =
             Eigr.Action.Protocol.Unary.handle_unary(unary_action, %Ping{name: "Anakin Skywalker"})
  end

  test "unary response with SideEffects" do
    unary_action = ActionEntityUnaryTest.new(context: %{})

    assert {:reply, %Ping{name: "Pong"},
            %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}} =
             Eigr.Action.Protocol.Unary.handle_unary(unary_action, %Pong{})
  end

  test "streamin simple call" do
    stream_in_action = ActionEntityStreamInTest.new(context: %{})

    stream =
      [%Ping{name: "Ping"}, %Ping{name: "Ping"}, %Ping{name: "Ping"}]
      |> Stream.map(fn elem -> elem end)

    assert %Ping{name: "Pooong"} =
             Eigr.Action.Protocol.StreamIn.handle_stream_in(stream_in_action, stream)
  end

  test "multi request types calls" do
    multi_action = ActionEntityMultiRequestTypeTest.new(context: %{})

    assert {:reply, %Ping{name: "Pong"},
            %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}} =
             Eigr.Action.Protocol.Unary.handle_unary(multi_action, %Pong{})

    stream =
      [%Ping{name: "Ping"}, %Ping{name: "Ping"}, %Ping{name: "Ping"}]
      |> Stream.map(fn elem -> elem end)

    assert %Ping{name: "Pooong"} =
             Eigr.Action.Protocol.StreamIn.handle_stream_in(multi_action, stream)
  end
end
