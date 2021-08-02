defmodule Permastate.Action.Server do
  use GRPC.Server, service: Cloudstate.Action.ActionProtocol.Service

  alias Permastate.Action.Handler, as: ActionHandler
  alias Permastate.Action.Supervisor, as: ActionSupervisor
  alias Cloudstate.Action.{ActionCommand, ActionResponse}

  @spec handle_unary(ActionCommand.t(), GRPC.Server.Stream.t()) :: ActionResponse.t()
  def handle_unary(command, _stream) do
    case ActionSupervisor.create_service_entity(command.service_name) do
      {:ok, _pid} -> ActionHandler.call(command.service_name, command)
    end
  end
end
