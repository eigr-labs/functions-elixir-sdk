defmodule Functions.Action.Handler do
  @moduledoc """
  GenServer for Handle Actions requests
  """
  use GenServer
  require Logger

  @impl true
  @spec init(any) :: {:ok, any}
  def init(service) do
    {:ok, service}
  end

  @impl true
  def handle_call({:call_unary, command}, from, service) do
    # In order to maximize the ability to handle requests, we ditch the heavy lifting for another process.
    spawn_link(fn ->
      action_reponse = handle_unary(service, command)
      GenServer.reply(from, action_reponse)
    end)

    {:noreply, service}
  end

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(%{name: name, service: service} = _state) do
    GenServer.start_link(__MODULE__, service, name: via(name))
  end

  @spec call(String.t(), any) :: any
  def call(service_name, payload) do
    GenServer.call(via(service_name), {:call_unary, payload})
  end

  defp handle_unary(service, command) do
    payload = command.payload

    case Functions.Action.Protocol.Unary.handle_unary(service, payload) do
      {:reply, data} ->
        Logger.debug("Entity Function reply with data: #{inspect(data)}")

        %Cloudstate.Action.ActionResponse{}

      {:reply, data, side_effects} ->
        Logger.debug(
          "Entity Function reply with data: #{inspect(data)} and Side Effects: #{
            inspect(side_effects)
          }"
        )

        %Cloudstate.Action.ActionResponse{}

      {:forward, data} ->
        Logger.debug("Entity Function forward with data: #{inspect(data)}")

        %Cloudstate.Action.ActionResponse{}

      {:forward, data, side_effects} ->
        Logger.debug(
          "Entity Function forward with data: #{inspect(data)} and Side Effects: #{
            inspect(side_effects)
          }"
        )

        %Cloudstate.Action.ActionResponse{}

      {:failure, message} ->
        Logger.error("Entity Function Error: #{message}")
        %Cloudstate.Action.ActionResponse{}
    end
  end

  defp via(name), do: {:via, Registry, {FunctionsRegistry, name}}
end
