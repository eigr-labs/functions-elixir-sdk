defmodule Permastate.EntityDiscovery.Handler do
  @moduledoc false
  use GenServer
  require Logger

  @impl true
  def init(entity_spec) do
    {:ok, entity_spec}
  end

  @impl true
  def handle_call({:proxy_info, proxy_info}, _from, entity_spec) do
    Logger.info(
      "Received discovery call from [#{inspect(proxy_info.proxy_name)} #{
        inspect(proxy_info.proxy_version)
      }] supporting Cloudstate protocol #{inspect(proxy_info.protocol_major_version)}.#{
        inspect(proxy_info.protocol_minor_version)
      }"
    )

    Logger.debug("Supported sidecar entity types: #{inspect(proxy_info.supported_entity_types)}")

    service_info =
      Cloudstate.ServiceInfo.new(
        service_name: entity_spec.service_name,
        service_version: "0.1.0",
        service_runtime: "Elixir #{inspect(System.version())}",
        support_library_name: Application.spec(:permastate)[:description],
        support_library_version: Application.spec(:permastate)[:vsn],
        protocol_major_version: 1,
        protocol_minor_version: 1
      )

    entities =
      entity_spec.entities
      |> Enum.map(&to_entity/1)
      |> Enum.reduce([], fn elem, acc ->
        acc ++ [elem]
      end)
      |> List.flatten()

    descriptors =
      entity_spec.entities
      |> Enum.map(fn entity ->
        case entity.descriptor do
          {:ok, descriptor} -> descriptor
          _ -> []
        end
      end)
      |> Enum.reduce([], fn elem, acc ->
        acc ++ [elem]
      end)
      |> List.flatten()

    Logger.debug("File descriptors: #{inspect(descriptors)}")

    spec =
      Cloudstate.EntitySpec.new(
        service_info: service_info,
        entities: entities,
        proto: descriptors
      )

    {:reply, spec, entity_spec}
  end

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(entities \\ []) do
    GenServer.start_link(__MODULE__, entities, name: __MODULE__)
  end

  def get_spec(proxy_info), do: GenServer.call(__MODULE__, {:proxy_info, proxy_info}, 10_000)

  defp to_entity(entity_spec) do
    Cloudstate.Entity.new(
      entity_type: get_entity_type(entity_spec),
      service_name: entity_spec.name,
      persistence_id: entity_spec.persistence_id
    )
  end

  defp get_entity_type(entity_spec) do
    case entity_spec.type do
      :action ->
        "cloudstate.action.ActionProtocol"

      :crdt ->
        "cloudstate.crdt.Crdt"

      :event_sourced ->
        "cloudstate.eventsourced.EventSourced"

      :value_entity ->
        "cloudstate.valueentity.ValueEntity"

      _ ->
        ""
    end
  end
end
