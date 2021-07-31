defmodule ActionContext do
  @type from :: pid()

  @spec send_reply(from(), any()) :: nil
  def send_reply(_from, _reply) do
  end
end
