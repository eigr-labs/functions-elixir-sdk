defmodule Permastate.EntityDiscovery.Server do
  use GRPC.Server, service: Cloudstate.EntityDiscovery.Service

  require Logger
  alias Google.Protobuf.Empty
  alias Permastate.EntityDiscovery.Handler, as: Discovery

  @spec discover(Cloudstate.ProxyInfo.t(), GRPC.Server.Stream.t()) :: Cloudstate.EntitySpec.t()
  def discover(proxy_info, _stream) do
    Logger.info("Received discover request from Proxy:\n #{inspect(proxy_info)}")
    Discovery.get_spec(proxy_info)
  end

  @spec report_error(Cloudstate.UserFunctionError.t(), GRPC.Server.Stream.t()) ::
          Google.Protobuf.Empty.t()
  def report_error(user_function_error, _stream) do
    Logger.error("User Function Error Reported. #{inspect(user_function_error)}")
    Empty.new()
  end
end
