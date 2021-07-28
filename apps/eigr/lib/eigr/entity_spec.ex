defmodule Eigr.EntitySpec do
  @moduledoc false

  defstruct [
    :service_name,
    :entities,
    :port
  ]

  @type t() :: %__MODULE__{
          service_name: String.t(),
          entities: [Eigr.Entity.t()],
          port: integer
        }
end
