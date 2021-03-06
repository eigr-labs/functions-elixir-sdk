defmodule Functions.Supervisor do
  @moduledoc """
  A Eigr Functions Elixir SDK.
  You can add it to your Supervisor tree as below.

      defmodule Shoppingcart.Application do
      @moduledoc false

      use Application

      @impl true
      def start(_type, _args) do
        action = %Functions.Entity{
          name: Atom.to_string(Com.Example.Shoppingcart.ShoppingCart),
          type: :action,
          service: Com.Example.Shoppingcart.ShoppingCart.Service,
          descriptor: File.read(Path.join(:code.priv_dir(:shoppingcart), "user-function.desc"))
        }

        entity_spec = %Functions.EntitySpec{
          service_name: Atom.to_string(Com.Example.Shoppingcart.ShoppingCart),
          entities: [action],
          port: 8080
        }

        children = [
          {Functions.Supervisor, entity_spec}
        ]

        opts = [strategy: :one_for_one, name: Shoppingcart.Supervisor]
        Supervisor.start_link(children, opts)
      end
    end

  """
  use Supervisor

  alias Functions.{Entity, EntitySpec}

  @impl true
  def init(entity_spec) do
    Application.put_env(:grpc, :start_server, true, persistent: true)

    children =
      [
        {Registry, keys: :unique, name: FunctionsRegistry}
      ] ++
        get_discovery(entity_spec) ++
        get_children(entity_spec) ++
        get_grpc(entity_spec)

    Supervisor.init(children, strategy: :one_for_one)
  end

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  @doc false
  def start_link(entity_spec) do
    Supervisor.start_link(__MODULE__, entity_spec, name: __MODULE__)
  end

  defp get_children(%EntitySpec{} = entity_spec) do
    entity_spec.entities
    |> Enum.map(&register_supervisor/1)
    |> Enum.reduce([], fn elem, acc ->
      [elem] ++ acc
    end)
  end

  defp register_supervisor(%Entity{type: type, service: service} = _entity) do
    case type do
      :action ->
        put_env(:action_service, service)
        Functions.Action.Supervisor

      :crdt ->
        put_env(:crdt_service, service)
        Functions.CRDT.Supervisor

      :event_sourced ->
        put_env(:event_sourced_service, service)
        Functions.EventSourced.Supervisor

      :value_entity ->
        put_env(:value_service, service)
        Functions.ValueEntity.Supervisor

      _ ->
        {nil, nil}
    end
  end

  defp get_discovery(entity_spec),
    do: [{Functions.EntityDiscovery.Handler, entity_spec}]

  defp get_grpc(%EntitySpec{port: port} = _entity_spec),
    do: [{GRPC.Server.Supervisor, {Functions.Endpoint, port}}]

  defp put_env(key, value),
    do: Application.put_env(:eigr_functions, key, value, persistent: true)
end
