defmodule Eigr.SideEffect do
  @moduledoc false

  defstruct [
    :service_name,
    :command_name,
    :payload
  ]

  @type t() :: %__MODULE__{
          service_name: String.t(),
          command_name: String.t(),
          payload: any()
        }
end
