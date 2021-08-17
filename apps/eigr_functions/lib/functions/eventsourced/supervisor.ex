defmodule Functions.EventSourced.Supervisor do
  @moduledoc false

  use DynamicSupervisor

  @impl true
  def init(_opts) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(opts) do
    DynamicSupervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @spec create_service_entity(String.t()) :: {:ok, pid()}
  def create_service_entity(name) do
    service = Application.get_env(:eigr_functions, :event_sourced_service)

    child_spec = %{
      id: String.to_atom(name),
      start: {Functions.EventSourced.Handler, :start_link, [%{name: name, service: service}]},
      restart: :transient
    }

    case DynamicSupervisor.start_child(__MODULE__, child_spec) do
      {:error, {:already_started, pid}} -> {:ok, pid}
      {:ok, pid} -> {:ok, pid}
    end
  end
end
