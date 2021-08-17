defmodule Functions.EventSourced.Context do
  defstruct [
    :entity_id,
    :state
  ]

  @type t :: %__MODULE__{
          entity_id: String.t(),
          state: any()
        }
end
