defmodule Functions.CRDT.Handler do
  @moduledoc false
  use GenServer

  @impl true
  def init(service) do
    {:ok, service}
  end

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(%{name: name, service: service} = _state) do
    GenServer.start_link(__MODULE__, service, name: via(name))
  end

  defp via(name), do: {:via, Registry, {FunctionsRegistry, name}}
end
