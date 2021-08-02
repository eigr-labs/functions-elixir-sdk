defmodule Permastate.Entity do
  @moduledoc false

  defstruct [
    :name,
    :type,
    :service,
    :persistence_id,
    :descriptor,
    :additional_descriptors
  ]

  @type t() :: %__MODULE__{
          name: String.t(),
          type: atom,
          service: module,
          persistence_id: String.t() | nil,
          descriptor: binary,
          additional_descriptors: [binary]
        }
end
