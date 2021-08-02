defmodule Permastate.ValueEntity.Context do
  defstruct [
    :entity_type,
    :entity_id,
    :state
  ]

  @type t :: %__MODULE__{
          entity_type: String.t(),
          entity_id: String.t(),
          state: any()
        }
end
