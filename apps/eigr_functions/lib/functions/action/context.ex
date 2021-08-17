defmodule Functions.Action.Context do
  defstruct [:entity_id]

  @type t :: %__MODULE__{
          entity_id: String.t()
        }

  @type from :: pid()

  @spec send_reply(from(), any()) :: nil
  def send_reply(_from, _reply) do
  end
end
