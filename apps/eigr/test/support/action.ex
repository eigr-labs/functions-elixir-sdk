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

  defimpl Eigr.Action.Protocol.Unary do
    def handle_unary(_context, %Ping{name: name} = _request) do
      {:reply, %Pong{name: name}}
    end

    def handle_unary(_context, %Pong{} = _request),
      do:
        {:reply, %Ping{name: "Pong"},
         %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}}
  end
end

defmodule ActionEntityStreamInTest do
  use Eigr.Action.Entity

  defimpl Eigr.Action.Protocol.StreamIn do
    def handle_stream_in(_context, stream) do
      Stream.map(stream, fn _elem -> %Ping{name: "Pooong"} end)
      |> Stream.take(1)
      |> Enum.to_list()
      |> Enum.fetch!(0)
    end
  end
end

defmodule ActionEntityMultiRequestTypeTest do
  use Eigr.Action.Entity

  defimpl Eigr.Action.Protocol.Unary do
    def handle_unary(_context, %Ping{name: name} = _request) do
      {:reply, %Pong{name: name}}
    end

    def handle_unary(_context, %Pong{} = _request),
      do:
        {:reply, %Ping{name: "Pong"},
         %Eigr.SideEffect{service_name: "test_service", command_name: "echo"}}
  end

  defimpl Eigr.Action.Protocol.StreamIn do
    def handle_stream_in(_context, stream) do
      Stream.map(stream, fn _elem -> %Ping{name: "Pooong"} end)
      |> Stream.take(1)
      |> Enum.to_list()
      |> Enum.fetch!(0)
    end
  end
end
