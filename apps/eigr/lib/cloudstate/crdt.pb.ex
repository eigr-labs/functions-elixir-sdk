defmodule Cloudstate.Crdt.CrdtWriteConsistency do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :LOCAL | :MAJORITY | :ALL

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.EnumDescriptorProto.decode(
      <<10, 20, 67, 114, 100, 116, 87, 114, 105, 116, 101, 67, 111, 110, 115, 105, 115, 116, 101,
        110, 99, 121, 18, 9, 10, 5, 76, 79, 67, 65, 76, 16, 0, 18, 12, 10, 8, 77, 65, 74, 79, 82,
        73, 84, 89, 16, 1, 18, 7, 10, 3, 65, 76, 76, 16, 2>>
    )
  end

  field(:LOCAL, 0)

  field(:MAJORITY, 1)

  field(:ALL, 2)
end

defmodule Cloudstate.Crdt.CrdtClock do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :DEFAULT | :REVERSE | :CUSTOM | :CUSTOM_AUTO_INCREMENT

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.EnumDescriptorProto.decode(
      <<10, 9, 67, 114, 100, 116, 67, 108, 111, 99, 107, 18, 11, 10, 7, 68, 69, 70, 65, 85, 76,
        84, 16, 0, 18, 11, 10, 7, 82, 69, 86, 69, 82, 83, 69, 16, 1, 18, 10, 10, 6, 67, 85, 83,
        84, 79, 77, 16, 2, 18, 25, 10, 21, 67, 85, 83, 84, 79, 77, 95, 65, 85, 84, 79, 95, 73, 78,
        67, 82, 69, 77, 69, 78, 84, 16, 3>>
    )
  end

  field(:DEFAULT, 0)

  field(:REVERSE, 1)

  field(:CUSTOM, 2)

  field(:CUSTOM_AUTO_INCREMENT, 3)
end

defmodule Cloudstate.Crdt.CrdtStreamIn do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          message: {atom, any}
        }

  defstruct [:message]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 12, 67, 114, 100, 116, 83, 116, 114, 101, 97, 109, 73, 110, 18, 47, 10, 4, 105, 110,
        105, 116, 24, 1, 32, 1, 40, 11, 50, 25, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116,
        101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 73, 110, 105, 116, 72, 0, 82, 4, 105,
        110, 105, 116, 18, 50, 10, 5, 115, 116, 97, 116, 101, 24, 2, 32, 1, 40, 11, 50, 26, 46,
        99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 67, 114, 100,
        116, 83, 116, 97, 116, 101, 72, 0, 82, 5, 115, 116, 97, 116, 101, 18, 54, 10, 7, 99, 104,
        97, 110, 103, 101, 100, 24, 3, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100, 115,
        116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 68, 101, 108, 116, 97,
        72, 0, 82, 7, 99, 104, 97, 110, 103, 101, 100, 18, 55, 10, 7, 100, 101, 108, 101, 116,
        101, 100, 24, 4, 32, 1, 40, 11, 50, 27, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116,
        101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 68, 101, 108, 101, 116, 101, 72, 0, 82,
        7, 100, 101, 108, 101, 116, 101, 100, 18, 47, 10, 7, 99, 111, 109, 109, 97, 110, 100, 24,
        5, 32, 1, 40, 11, 50, 19, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 67, 111,
        109, 109, 97, 110, 100, 72, 0, 82, 7, 99, 111, 109, 109, 97, 110, 100, 18, 72, 10, 16,
        115, 116, 114, 101, 97, 109, 95, 99, 97, 110, 99, 101, 108, 108, 101, 100, 24, 6, 32, 1,
        40, 11, 50, 27, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 83, 116, 114, 101,
        97, 109, 67, 97, 110, 99, 101, 108, 108, 101, 100, 72, 0, 82, 15, 115, 116, 114, 101, 97,
        109, 67, 97, 110, 99, 101, 108, 108, 101, 100, 66, 9, 10, 7, 109, 101, 115, 115, 97, 103,
        101>>
    )
  end

  oneof(:message, 0)
  field(:init, 1, type: Cloudstate.Crdt.CrdtInit, oneof: 0)
  field(:state, 2, type: Cloudstate.Crdt.CrdtState, oneof: 0)
  field(:changed, 3, type: Cloudstate.Crdt.CrdtDelta, oneof: 0)
  field(:deleted, 4, type: Cloudstate.Crdt.CrdtDelete, oneof: 0)
  field(:command, 5, type: Cloudstate.Command, oneof: 0)
  field(:stream_cancelled, 6, type: Cloudstate.StreamCancelled, oneof: 0)
end

defmodule Cloudstate.Crdt.CrdtStreamOut do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          message: {atom, any}
        }

  defstruct [:message]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 13, 67, 114, 100, 116, 83, 116, 114, 101, 97, 109, 79, 117, 116, 18, 50, 10, 5, 114,
        101, 112, 108, 121, 24, 1, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100, 115, 116,
        97, 116, 101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 82, 101, 112, 108, 121, 72, 0,
        82, 5, 114, 101, 112, 108, 121, 18, 81, 10, 16, 115, 116, 114, 101, 97, 109, 101, 100, 95,
        109, 101, 115, 115, 97, 103, 101, 24, 2, 32, 1, 40, 11, 50, 36, 46, 99, 108, 111, 117,
        100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 83, 116, 114,
        101, 97, 109, 101, 100, 77, 101, 115, 115, 97, 103, 101, 72, 0, 82, 15, 115, 116, 114,
        101, 97, 109, 101, 100, 77, 101, 115, 115, 97, 103, 101, 18, 106, 10, 25, 115, 116, 114,
        101, 97, 109, 95, 99, 97, 110, 99, 101, 108, 108, 101, 100, 95, 114, 101, 115, 112, 111,
        110, 115, 101, 24, 3, 32, 1, 40, 11, 50, 44, 46, 99, 108, 111, 117, 100, 115, 116, 97,
        116, 101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 83, 116, 114, 101, 97, 109, 67,
        97, 110, 99, 101, 108, 108, 101, 100, 82, 101, 115, 112, 111, 110, 115, 101, 72, 0, 82,
        23, 115, 116, 114, 101, 97, 109, 67, 97, 110, 99, 101, 108, 108, 101, 100, 82, 101, 115,
        112, 111, 110, 115, 101, 18, 47, 10, 7, 102, 97, 105, 108, 117, 114, 101, 24, 4, 32, 1,
        40, 11, 50, 19, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 70, 97, 105, 108,
        117, 114, 101, 72, 0, 82, 7, 102, 97, 105, 108, 117, 114, 101, 66, 9, 10, 7, 109, 101,
        115, 115, 97, 103, 101>>
    )
  end

  oneof(:message, 0)
  field(:reply, 1, type: Cloudstate.Crdt.CrdtReply, oneof: 0)
  field(:streamed_message, 2, type: Cloudstate.Crdt.CrdtStreamedMessage, oneof: 0)

  field(:stream_cancelled_response, 3, type: Cloudstate.Crdt.CrdtStreamCancelledResponse, oneof: 0)

  field(:failure, 4, type: Cloudstate.Failure, oneof: 0)
end

defmodule Cloudstate.Crdt.CrdtState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          state: {atom, any}
        }

  defstruct [:state]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 67, 114, 100, 116, 83, 116, 97, 116, 101, 18, 60, 10, 8, 103, 99, 111, 117, 110,
        116, 101, 114, 24, 1, 32, 1, 40, 11, 50, 30, 46, 99, 108, 111, 117, 100, 115, 116, 97,
        116, 101, 46, 99, 114, 100, 116, 46, 71, 67, 111, 117, 110, 116, 101, 114, 83, 116, 97,
        116, 101, 72, 0, 82, 8, 103, 99, 111, 117, 110, 116, 101, 114, 18, 63, 10, 9, 112, 110,
        99, 111, 117, 110, 116, 101, 114, 24, 2, 32, 1, 40, 11, 50, 31, 46, 99, 108, 111, 117,
        100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 80, 78, 67, 111, 117, 110, 116,
        101, 114, 83, 116, 97, 116, 101, 72, 0, 82, 9, 112, 110, 99, 111, 117, 110, 116, 101, 114,
        18, 48, 10, 4, 103, 115, 101, 116, 24, 3, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117,
        100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 71, 83, 101, 116, 83, 116, 97,
        116, 101, 72, 0, 82, 4, 103, 115, 101, 116, 18, 51, 10, 5, 111, 114, 115, 101, 116, 24, 4,
        32, 1, 40, 11, 50, 27, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114,
        100, 116, 46, 79, 82, 83, 101, 116, 83, 116, 97, 116, 101, 72, 0, 82, 5, 111, 114, 115,
        101, 116, 18, 69, 10, 11, 108, 119, 119, 114, 101, 103, 105, 115, 116, 101, 114, 24, 5,
        32, 1, 40, 11, 50, 33, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114,
        100, 116, 46, 76, 87, 87, 82, 101, 103, 105, 115, 116, 101, 114, 83, 116, 97, 116, 101,
        72, 0, 82, 11, 108, 119, 119, 114, 101, 103, 105, 115, 116, 101, 114, 18, 48, 10, 4, 102,
        108, 97, 103, 24, 6, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116,
        101, 46, 99, 114, 100, 116, 46, 70, 108, 97, 103, 83, 116, 97, 116, 101, 72, 0, 82, 4,
        102, 108, 97, 103, 18, 51, 10, 5, 111, 114, 109, 97, 112, 24, 7, 32, 1, 40, 11, 50, 27,
        46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 79, 82, 77,
        97, 112, 83, 116, 97, 116, 101, 72, 0, 82, 5, 111, 114, 109, 97, 112, 18, 48, 10, 4, 118,
        111, 116, 101, 24, 8, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100, 115, 116, 97,
        116, 101, 46, 99, 114, 100, 116, 46, 86, 111, 116, 101, 83, 116, 97, 116, 101, 72, 0, 82,
        4, 118, 111, 116, 101, 66, 7, 10, 5, 115, 116, 97, 116, 101>>
    )
  end

  oneof(:state, 0)
  field(:gcounter, 1, type: Cloudstate.Crdt.GCounterState, oneof: 0)
  field(:pncounter, 2, type: Cloudstate.Crdt.PNCounterState, oneof: 0)
  field(:gset, 3, type: Cloudstate.Crdt.GSetState, oneof: 0)
  field(:orset, 4, type: Cloudstate.Crdt.ORSetState, oneof: 0)
  field(:lwwregister, 5, type: Cloudstate.Crdt.LWWRegisterState, oneof: 0)
  field(:flag, 6, type: Cloudstate.Crdt.FlagState, oneof: 0)
  field(:ormap, 7, type: Cloudstate.Crdt.ORMapState, oneof: 0)
  field(:vote, 8, type: Cloudstate.Crdt.VoteState, oneof: 0)
end

defmodule Cloudstate.Crdt.GCounterState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: non_neg_integer
        }

  defstruct [:value]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 13, 71, 67, 111, 117, 110, 116, 101, 114, 83, 116, 97, 116, 101, 18, 20, 10, 5, 118,
        97, 108, 117, 101, 24, 1, 32, 1, 40, 4, 82, 5, 118, 97, 108, 117, 101>>
    )
  end

  field(:value, 1, type: :uint64)
end

defmodule Cloudstate.Crdt.PNCounterState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: integer
        }

  defstruct [:value]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 14, 80, 78, 67, 111, 117, 110, 116, 101, 114, 83, 116, 97, 116, 101, 18, 20, 10, 5,
        118, 97, 108, 117, 101, 24, 1, 32, 1, 40, 3, 82, 5, 118, 97, 108, 117, 101>>
    )
  end

  field(:value, 1, type: :int64)
end

defmodule Cloudstate.Crdt.GSetState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          items: [Google.Protobuf.Any.t()]
        }

  defstruct [:items]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 71, 83, 101, 116, 83, 116, 97, 116, 101, 18, 42, 10, 5, 105, 116, 101, 109, 115,
        24, 1, 32, 3, 40, 11, 50, 20, 46, 103, 111, 111, 103, 108, 101, 46, 112, 114, 111, 116,
        111, 98, 117, 102, 46, 65, 110, 121, 82, 5, 105, 116, 101, 109, 115>>
    )
  end

  field(:items, 1, repeated: true, type: Google.Protobuf.Any)
end

defmodule Cloudstate.Crdt.ORSetState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          items: [Google.Protobuf.Any.t()]
        }

  defstruct [:items]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 10, 79, 82, 83, 101, 116, 83, 116, 97, 116, 101, 18, 42, 10, 5, 105, 116, 101, 109,
        115, 24, 1, 32, 3, 40, 11, 50, 20, 46, 103, 111, 111, 103, 108, 101, 46, 112, 114, 111,
        116, 111, 98, 117, 102, 46, 65, 110, 121, 82, 5, 105, 116, 101, 109, 115>>
    )
  end

  field(:items, 1, repeated: true, type: Google.Protobuf.Any)
end

defmodule Cloudstate.Crdt.LWWRegisterState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: Google.Protobuf.Any.t() | nil,
          clock: Cloudstate.Crdt.CrdtClock.t(),
          custom_clock_value: integer
        }

  defstruct [:value, :clock, :custom_clock_value]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 16, 76, 87, 87, 82, 101, 103, 105, 115, 116, 101, 114, 83, 116, 97, 116, 101, 18, 42,
        10, 5, 118, 97, 108, 117, 101, 24, 1, 32, 1, 40, 11, 50, 20, 46, 103, 111, 111, 103, 108,
        101, 46, 112, 114, 111, 116, 111, 98, 117, 102, 46, 65, 110, 121, 82, 5, 118, 97, 108,
        117, 101, 18, 48, 10, 5, 99, 108, 111, 99, 107, 24, 2, 32, 1, 40, 14, 50, 26, 46, 99, 108,
        111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 67,
        108, 111, 99, 107, 82, 5, 99, 108, 111, 99, 107, 18, 44, 10, 18, 99, 117, 115, 116, 111,
        109, 95, 99, 108, 111, 99, 107, 95, 118, 97, 108, 117, 101, 24, 3, 32, 1, 40, 3, 82, 16,
        99, 117, 115, 116, 111, 109, 67, 108, 111, 99, 107, 86, 97, 108, 117, 101>>
    )
  end

  field(:value, 1, type: Google.Protobuf.Any)
  field(:clock, 2, type: Cloudstate.Crdt.CrdtClock, enum: true)
  field(:custom_clock_value, 3, type: :int64)
end

defmodule Cloudstate.Crdt.FlagState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: boolean
        }

  defstruct [:value]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 70, 108, 97, 103, 83, 116, 97, 116, 101, 18, 20, 10, 5, 118, 97, 108, 117, 101, 24,
        1, 32, 1, 40, 8, 82, 5, 118, 97, 108, 117, 101>>
    )
  end

  field(:value, 1, type: :bool)
end

defmodule Cloudstate.Crdt.ORMapState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          entries: [Cloudstate.Crdt.ORMapEntry.t()]
        }

  defstruct [:entries]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 10, 79, 82, 77, 97, 112, 83, 116, 97, 116, 101, 18, 53, 10, 7, 101, 110, 116, 114,
        105, 101, 115, 24, 1, 32, 3, 40, 11, 50, 27, 46, 99, 108, 111, 117, 100, 115, 116, 97,
        116, 101, 46, 99, 114, 100, 116, 46, 79, 82, 77, 97, 112, 69, 110, 116, 114, 121, 82, 7,
        101, 110, 116, 114, 105, 101, 115>>
    )
  end

  field(:entries, 1, repeated: true, type: Cloudstate.Crdt.ORMapEntry)
end

defmodule Cloudstate.Crdt.ORMapEntry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: Google.Protobuf.Any.t() | nil,
          value: Cloudstate.Crdt.CrdtState.t() | nil
        }

  defstruct [:key, :value]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 10, 79, 82, 77, 97, 112, 69, 110, 116, 114, 121, 18, 38, 10, 3, 107, 101, 121, 24, 1,
        32, 1, 40, 11, 50, 20, 46, 103, 111, 111, 103, 108, 101, 46, 112, 114, 111, 116, 111, 98,
        117, 102, 46, 65, 110, 121, 82, 3, 107, 101, 121, 18, 48, 10, 5, 118, 97, 108, 117, 101,
        24, 2, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99,
        114, 100, 116, 46, 67, 114, 100, 116, 83, 116, 97, 116, 101, 82, 5, 118, 97, 108, 117,
        101>>
    )
  end

  field(:key, 1, type: Google.Protobuf.Any)
  field(:value, 2, type: Cloudstate.Crdt.CrdtState)
end

defmodule Cloudstate.Crdt.VoteState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          votes_for: non_neg_integer,
          total_voters: non_neg_integer,
          self_vote: boolean
        }

  defstruct [:votes_for, :total_voters, :self_vote]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 86, 111, 116, 101, 83, 116, 97, 116, 101, 18, 27, 10, 9, 118, 111, 116, 101, 115,
        95, 102, 111, 114, 24, 1, 32, 1, 40, 13, 82, 8, 118, 111, 116, 101, 115, 70, 111, 114, 18,
        33, 10, 12, 116, 111, 116, 97, 108, 95, 118, 111, 116, 101, 114, 115, 24, 2, 32, 1, 40,
        13, 82, 11, 116, 111, 116, 97, 108, 86, 111, 116, 101, 114, 115, 18, 27, 10, 9, 115, 101,
        108, 102, 95, 118, 111, 116, 101, 24, 3, 32, 1, 40, 8, 82, 8, 115, 101, 108, 102, 86, 111,
        116, 101>>
    )
  end

  field(:votes_for, 1, type: :uint32)
  field(:total_voters, 2, type: :uint32)
  field(:self_vote, 3, type: :bool)
end

defmodule Cloudstate.Crdt.CrdtDelta do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          delta: {atom, any}
        }

  defstruct [:delta]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 67, 114, 100, 116, 68, 101, 108, 116, 97, 18, 60, 10, 8, 103, 99, 111, 117, 110,
        116, 101, 114, 24, 1, 32, 1, 40, 11, 50, 30, 46, 99, 108, 111, 117, 100, 115, 116, 97,
        116, 101, 46, 99, 114, 100, 116, 46, 71, 67, 111, 117, 110, 116, 101, 114, 68, 101, 108,
        116, 97, 72, 0, 82, 8, 103, 99, 111, 117, 110, 116, 101, 114, 18, 63, 10, 9, 112, 110, 99,
        111, 117, 110, 116, 101, 114, 24, 2, 32, 1, 40, 11, 50, 31, 46, 99, 108, 111, 117, 100,
        115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 80, 78, 67, 111, 117, 110, 116, 101,
        114, 68, 101, 108, 116, 97, 72, 0, 82, 9, 112, 110, 99, 111, 117, 110, 116, 101, 114, 18,
        48, 10, 4, 103, 115, 101, 116, 24, 3, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100,
        115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 71, 83, 101, 116, 68, 101, 108, 116,
        97, 72, 0, 82, 4, 103, 115, 101, 116, 18, 51, 10, 5, 111, 114, 115, 101, 116, 24, 4, 32,
        1, 40, 11, 50, 27, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100,
        116, 46, 79, 82, 83, 101, 116, 68, 101, 108, 116, 97, 72, 0, 82, 5, 111, 114, 115, 101,
        116, 18, 69, 10, 11, 108, 119, 119, 114, 101, 103, 105, 115, 116, 101, 114, 24, 5, 32, 1,
        40, 11, 50, 33, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116,
        46, 76, 87, 87, 82, 101, 103, 105, 115, 116, 101, 114, 68, 101, 108, 116, 97, 72, 0, 82,
        11, 108, 119, 119, 114, 101, 103, 105, 115, 116, 101, 114, 18, 48, 10, 4, 102, 108, 97,
        103, 24, 6, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46,
        99, 114, 100, 116, 46, 70, 108, 97, 103, 68, 101, 108, 116, 97, 72, 0, 82, 4, 102, 108,
        97, 103, 18, 51, 10, 5, 111, 114, 109, 97, 112, 24, 7, 32, 1, 40, 11, 50, 27, 46, 99, 108,
        111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 79, 82, 77, 97, 112, 68,
        101, 108, 116, 97, 72, 0, 82, 5, 111, 114, 109, 97, 112, 18, 48, 10, 4, 118, 111, 116,
        101, 24, 8, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46,
        99, 114, 100, 116, 46, 86, 111, 116, 101, 68, 101, 108, 116, 97, 72, 0, 82, 4, 118, 111,
        116, 101, 66, 7, 10, 5, 100, 101, 108, 116, 97>>
    )
  end

  oneof(:delta, 0)
  field(:gcounter, 1, type: Cloudstate.Crdt.GCounterDelta, oneof: 0)
  field(:pncounter, 2, type: Cloudstate.Crdt.PNCounterDelta, oneof: 0)
  field(:gset, 3, type: Cloudstate.Crdt.GSetDelta, oneof: 0)
  field(:orset, 4, type: Cloudstate.Crdt.ORSetDelta, oneof: 0)
  field(:lwwregister, 5, type: Cloudstate.Crdt.LWWRegisterDelta, oneof: 0)
  field(:flag, 6, type: Cloudstate.Crdt.FlagDelta, oneof: 0)
  field(:ormap, 7, type: Cloudstate.Crdt.ORMapDelta, oneof: 0)
  field(:vote, 8, type: Cloudstate.Crdt.VoteDelta, oneof: 0)
end

defmodule Cloudstate.Crdt.GCounterDelta do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          increment: non_neg_integer
        }

  defstruct [:increment]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 13, 71, 67, 111, 117, 110, 116, 101, 114, 68, 101, 108, 116, 97, 18, 28, 10, 9, 105,
        110, 99, 114, 101, 109, 101, 110, 116, 24, 1, 32, 1, 40, 4, 82, 9, 105, 110, 99, 114, 101,
        109, 101, 110, 116>>
    )
  end

  field(:increment, 1, type: :uint64)
end

defmodule Cloudstate.Crdt.PNCounterDelta do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          change: integer
        }

  defstruct [:change]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 14, 80, 78, 67, 111, 117, 110, 116, 101, 114, 68, 101, 108, 116, 97, 18, 22, 10, 6,
        99, 104, 97, 110, 103, 101, 24, 1, 32, 1, 40, 18, 82, 6, 99, 104, 97, 110, 103, 101>>
    )
  end

  field(:change, 1, type: :sint64)
end

defmodule Cloudstate.Crdt.GSetDelta do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          added: [Google.Protobuf.Any.t()]
        }

  defstruct [:added]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 71, 83, 101, 116, 68, 101, 108, 116, 97, 18, 42, 10, 5, 97, 100, 100, 101, 100, 24,
        1, 32, 3, 40, 11, 50, 20, 46, 103, 111, 111, 103, 108, 101, 46, 112, 114, 111, 116, 111,
        98, 117, 102, 46, 65, 110, 121, 82, 5, 97, 100, 100, 101, 100>>
    )
  end

  field(:added, 1, repeated: true, type: Google.Protobuf.Any)
end

defmodule Cloudstate.Crdt.ORSetDelta do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cleared: boolean,
          removed: [Google.Protobuf.Any.t()],
          added: [Google.Protobuf.Any.t()]
        }

  defstruct [:cleared, :removed, :added]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 10, 79, 82, 83, 101, 116, 68, 101, 108, 116, 97, 18, 24, 10, 7, 99, 108, 101, 97, 114,
        101, 100, 24, 1, 32, 1, 40, 8, 82, 7, 99, 108, 101, 97, 114, 101, 100, 18, 46, 10, 7, 114,
        101, 109, 111, 118, 101, 100, 24, 2, 32, 3, 40, 11, 50, 20, 46, 103, 111, 111, 103, 108,
        101, 46, 112, 114, 111, 116, 111, 98, 117, 102, 46, 65, 110, 121, 82, 7, 114, 101, 109,
        111, 118, 101, 100, 18, 42, 10, 5, 97, 100, 100, 101, 100, 24, 3, 32, 3, 40, 11, 50, 20,
        46, 103, 111, 111, 103, 108, 101, 46, 112, 114, 111, 116, 111, 98, 117, 102, 46, 65, 110,
        121, 82, 5, 97, 100, 100, 101, 100>>
    )
  end

  field(:cleared, 1, type: :bool)
  field(:removed, 2, repeated: true, type: Google.Protobuf.Any)
  field(:added, 3, repeated: true, type: Google.Protobuf.Any)
end

defmodule Cloudstate.Crdt.LWWRegisterDelta do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: Google.Protobuf.Any.t() | nil,
          clock: Cloudstate.Crdt.CrdtClock.t(),
          custom_clock_value: integer
        }

  defstruct [:value, :clock, :custom_clock_value]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 16, 76, 87, 87, 82, 101, 103, 105, 115, 116, 101, 114, 68, 101, 108, 116, 97, 18, 42,
        10, 5, 118, 97, 108, 117, 101, 24, 1, 32, 1, 40, 11, 50, 20, 46, 103, 111, 111, 103, 108,
        101, 46, 112, 114, 111, 116, 111, 98, 117, 102, 46, 65, 110, 121, 82, 5, 118, 97, 108,
        117, 101, 18, 48, 10, 5, 99, 108, 111, 99, 107, 24, 2, 32, 1, 40, 14, 50, 26, 46, 99, 108,
        111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 67,
        108, 111, 99, 107, 82, 5, 99, 108, 111, 99, 107, 18, 44, 10, 18, 99, 117, 115, 116, 111,
        109, 95, 99, 108, 111, 99, 107, 95, 118, 97, 108, 117, 101, 24, 3, 32, 1, 40, 3, 82, 16,
        99, 117, 115, 116, 111, 109, 67, 108, 111, 99, 107, 86, 97, 108, 117, 101>>
    )
  end

  field(:value, 1, type: Google.Protobuf.Any)
  field(:clock, 2, type: Cloudstate.Crdt.CrdtClock, enum: true)
  field(:custom_clock_value, 3, type: :int64)
end

defmodule Cloudstate.Crdt.FlagDelta do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: boolean
        }

  defstruct [:value]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 70, 108, 97, 103, 68, 101, 108, 116, 97, 18, 20, 10, 5, 118, 97, 108, 117, 101, 24,
        1, 32, 1, 40, 8, 82, 5, 118, 97, 108, 117, 101>>
    )
  end

  field(:value, 1, type: :bool)
end

defmodule Cloudstate.Crdt.ORMapDelta do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cleared: boolean,
          removed: [Google.Protobuf.Any.t()],
          updated: [Cloudstate.Crdt.ORMapEntryDelta.t()],
          added: [Cloudstate.Crdt.ORMapEntry.t()]
        }

  defstruct [:cleared, :removed, :updated, :added]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 10, 79, 82, 77, 97, 112, 68, 101, 108, 116, 97, 18, 24, 10, 7, 99, 108, 101, 97, 114,
        101, 100, 24, 1, 32, 1, 40, 8, 82, 7, 99, 108, 101, 97, 114, 101, 100, 18, 46, 10, 7, 114,
        101, 109, 111, 118, 101, 100, 24, 2, 32, 3, 40, 11, 50, 20, 46, 103, 111, 111, 103, 108,
        101, 46, 112, 114, 111, 116, 111, 98, 117, 102, 46, 65, 110, 121, 82, 7, 114, 101, 109,
        111, 118, 101, 100, 18, 58, 10, 7, 117, 112, 100, 97, 116, 101, 100, 24, 3, 32, 3, 40, 11,
        50, 32, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 79,
        82, 77, 97, 112, 69, 110, 116, 114, 121, 68, 101, 108, 116, 97, 82, 7, 117, 112, 100, 97,
        116, 101, 100, 18, 49, 10, 5, 97, 100, 100, 101, 100, 24, 4, 32, 3, 40, 11, 50, 27, 46,
        99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 79, 82, 77, 97,
        112, 69, 110, 116, 114, 121, 82, 5, 97, 100, 100, 101, 100>>
    )
  end

  field(:cleared, 1, type: :bool)
  field(:removed, 2, repeated: true, type: Google.Protobuf.Any)
  field(:updated, 3, repeated: true, type: Cloudstate.Crdt.ORMapEntryDelta)
  field(:added, 4, repeated: true, type: Cloudstate.Crdt.ORMapEntry)
end

defmodule Cloudstate.Crdt.ORMapEntryDelta do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: Google.Protobuf.Any.t() | nil,
          delta: Cloudstate.Crdt.CrdtDelta.t() | nil
        }

  defstruct [:key, :delta]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 15, 79, 82, 77, 97, 112, 69, 110, 116, 114, 121, 68, 101, 108, 116, 97, 18, 38, 10, 3,
        107, 101, 121, 24, 1, 32, 1, 40, 11, 50, 20, 46, 103, 111, 111, 103, 108, 101, 46, 112,
        114, 111, 116, 111, 98, 117, 102, 46, 65, 110, 121, 82, 3, 107, 101, 121, 18, 48, 10, 5,
        100, 101, 108, 116, 97, 24, 2, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100, 115,
        116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 68, 101, 108, 116, 97,
        82, 5, 100, 101, 108, 116, 97>>
    )
  end

  field(:key, 1, type: Google.Protobuf.Any)
  field(:delta, 2, type: Cloudstate.Crdt.CrdtDelta)
end

defmodule Cloudstate.Crdt.VoteDelta do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          self_vote: boolean,
          votes_for: integer,
          total_voters: integer
        }

  defstruct [:self_vote, :votes_for, :total_voters]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 86, 111, 116, 101, 68, 101, 108, 116, 97, 18, 27, 10, 9, 115, 101, 108, 102, 95,
        118, 111, 116, 101, 24, 1, 32, 1, 40, 8, 82, 8, 115, 101, 108, 102, 86, 111, 116, 101, 18,
        27, 10, 9, 118, 111, 116, 101, 115, 95, 102, 111, 114, 24, 2, 32, 1, 40, 5, 82, 8, 118,
        111, 116, 101, 115, 70, 111, 114, 18, 33, 10, 12, 116, 111, 116, 97, 108, 95, 118, 111,
        116, 101, 114, 115, 24, 3, 32, 1, 40, 5, 82, 11, 116, 111, 116, 97, 108, 86, 111, 116,
        101, 114, 115>>
    )
  end

  field(:self_vote, 1, type: :bool)
  field(:votes_for, 2, type: :int32)
  field(:total_voters, 3, type: :int32)
end

defmodule Cloudstate.Crdt.CrdtInit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          service_name: String.t(),
          entity_id: String.t(),
          state: Cloudstate.Crdt.CrdtState.t() | nil
        }

  defstruct [:service_name, :entity_id, :state]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 8, 67, 114, 100, 116, 73, 110, 105, 116, 18, 33, 10, 12, 115, 101, 114, 118, 105, 99,
        101, 95, 110, 97, 109, 101, 24, 1, 32, 1, 40, 9, 82, 11, 115, 101, 114, 118, 105, 99, 101,
        78, 97, 109, 101, 18, 27, 10, 9, 101, 110, 116, 105, 116, 121, 95, 105, 100, 24, 2, 32, 1,
        40, 9, 82, 8, 101, 110, 116, 105, 116, 121, 73, 100, 18, 48, 10, 5, 115, 116, 97, 116,
        101, 24, 3, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46,
        99, 114, 100, 116, 46, 67, 114, 100, 116, 83, 116, 97, 116, 101, 82, 5, 115, 116, 97, 116,
        101>>
    )
  end

  field(:service_name, 1, type: :string)
  field(:entity_id, 2, type: :string)
  field(:state, 3, type: Cloudstate.Crdt.CrdtState)
end

defmodule Cloudstate.Crdt.CrdtDelete do
  @moduledoc false
  use Protobuf, syntax: :proto3
  @type t :: %__MODULE__{}

  defstruct []

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode("\n\nCrdtDelete")
  end
end

defmodule Cloudstate.Crdt.CrdtReply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          command_id: integer,
          client_action: Cloudstate.ClientAction.t() | nil,
          side_effects: [Cloudstate.SideEffect.t()],
          state_action: Cloudstate.Crdt.CrdtStateAction.t() | nil,
          streamed: boolean
        }

  defstruct [:command_id, :client_action, :side_effects, :state_action, :streamed]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 67, 114, 100, 116, 82, 101, 112, 108, 121, 18, 29, 10, 10, 99, 111, 109, 109, 97,
        110, 100, 95, 105, 100, 24, 1, 32, 1, 40, 3, 82, 9, 99, 111, 109, 109, 97, 110, 100, 73,
        100, 18, 61, 10, 13, 99, 108, 105, 101, 110, 116, 95, 97, 99, 116, 105, 111, 110, 24, 2,
        32, 1, 40, 11, 50, 24, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 67, 108,
        105, 101, 110, 116, 65, 99, 116, 105, 111, 110, 82, 12, 99, 108, 105, 101, 110, 116, 65,
        99, 116, 105, 111, 110, 18, 57, 10, 12, 115, 105, 100, 101, 95, 101, 102, 102, 101, 99,
        116, 115, 24, 4, 32, 3, 40, 11, 50, 22, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116,
        101, 46, 83, 105, 100, 101, 69, 102, 102, 101, 99, 116, 82, 11, 115, 105, 100, 101, 69,
        102, 102, 101, 99, 116, 115, 18, 67, 10, 12, 115, 116, 97, 116, 101, 95, 97, 99, 116, 105,
        111, 110, 24, 5, 32, 1, 40, 11, 50, 32, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116,
        101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 83, 116, 97, 116, 101, 65, 99, 116,
        105, 111, 110, 82, 11, 115, 116, 97, 116, 101, 65, 99, 116, 105, 111, 110, 18, 26, 10, 8,
        115, 116, 114, 101, 97, 109, 101, 100, 24, 6, 32, 1, 40, 8, 82, 8, 115, 116, 114, 101, 97,
        109, 101, 100>>
    )
  end

  field(:command_id, 1, type: :int64)
  field(:client_action, 2, type: Cloudstate.ClientAction)
  field(:side_effects, 4, repeated: true, type: Cloudstate.SideEffect)
  field(:state_action, 5, type: Cloudstate.Crdt.CrdtStateAction)
  field(:streamed, 6, type: :bool)
end

defmodule Cloudstate.Crdt.CrdtStateAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          action: {atom, any},
          write_consistency: Cloudstate.Crdt.CrdtWriteConsistency.t()
        }

  defstruct [:action, :write_consistency]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 15, 67, 114, 100, 116, 83, 116, 97, 116, 101, 65, 99, 116, 105, 111, 110, 18, 52, 10,
        6, 99, 114, 101, 97, 116, 101, 24, 5, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100,
        115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 83, 116, 97, 116,
        101, 72, 0, 82, 6, 99, 114, 101, 97, 116, 101, 18, 52, 10, 6, 117, 112, 100, 97, 116, 101,
        24, 6, 32, 1, 40, 11, 50, 26, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99,
        114, 100, 116, 46, 67, 114, 100, 116, 68, 101, 108, 116, 97, 72, 0, 82, 6, 117, 112, 100,
        97, 116, 101, 18, 53, 10, 6, 100, 101, 108, 101, 116, 101, 24, 7, 32, 1, 40, 11, 50, 27,
        46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 67, 114,
        100, 116, 68, 101, 108, 101, 116, 101, 72, 0, 82, 6, 100, 101, 108, 101, 116, 101, 18, 82,
        10, 17, 119, 114, 105, 116, 101, 95, 99, 111, 110, 115, 105, 115, 116, 101, 110, 99, 121,
        24, 8, 32, 1, 40, 14, 50, 37, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99,
        114, 100, 116, 46, 67, 114, 100, 116, 87, 114, 105, 116, 101, 67, 111, 110, 115, 105, 115,
        116, 101, 110, 99, 121, 82, 16, 119, 114, 105, 116, 101, 67, 111, 110, 115, 105, 115, 116,
        101, 110, 99, 121, 66, 8, 10, 6, 97, 99, 116, 105, 111, 110>>
    )
  end

  oneof(:action, 0)
  field(:create, 5, type: Cloudstate.Crdt.CrdtState, oneof: 0)
  field(:update, 6, type: Cloudstate.Crdt.CrdtDelta, oneof: 0)
  field(:delete, 7, type: Cloudstate.Crdt.CrdtDelete, oneof: 0)
  field(:write_consistency, 8, type: Cloudstate.Crdt.CrdtWriteConsistency, enum: true)
end

defmodule Cloudstate.Crdt.CrdtStreamedMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          command_id: integer,
          client_action: Cloudstate.ClientAction.t() | nil,
          side_effects: [Cloudstate.SideEffect.t()],
          end_stream: boolean
        }

  defstruct [:command_id, :client_action, :side_effects, :end_stream]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 19, 67, 114, 100, 116, 83, 116, 114, 101, 97, 109, 101, 100, 77, 101, 115, 115, 97,
        103, 101, 18, 29, 10, 10, 99, 111, 109, 109, 97, 110, 100, 95, 105, 100, 24, 1, 32, 1, 40,
        3, 82, 9, 99, 111, 109, 109, 97, 110, 100, 73, 100, 18, 61, 10, 13, 99, 108, 105, 101,
        110, 116, 95, 97, 99, 116, 105, 111, 110, 24, 2, 32, 1, 40, 11, 50, 24, 46, 99, 108, 111,
        117, 100, 115, 116, 97, 116, 101, 46, 67, 108, 105, 101, 110, 116, 65, 99, 116, 105, 111,
        110, 82, 12, 99, 108, 105, 101, 110, 116, 65, 99, 116, 105, 111, 110, 18, 57, 10, 12, 115,
        105, 100, 101, 95, 101, 102, 102, 101, 99, 116, 115, 24, 3, 32, 3, 40, 11, 50, 22, 46, 99,
        108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 83, 105, 100, 101, 69, 102, 102, 101, 99,
        116, 82, 11, 115, 105, 100, 101, 69, 102, 102, 101, 99, 116, 115, 18, 29, 10, 10, 101,
        110, 100, 95, 115, 116, 114, 101, 97, 109, 24, 4, 32, 1, 40, 8, 82, 9, 101, 110, 100, 83,
        116, 114, 101, 97, 109>>
    )
  end

  field(:command_id, 1, type: :int64)
  field(:client_action, 2, type: Cloudstate.ClientAction)
  field(:side_effects, 3, repeated: true, type: Cloudstate.SideEffect)
  field(:end_stream, 4, type: :bool)
end

defmodule Cloudstate.Crdt.CrdtStreamCancelledResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          command_id: integer,
          side_effects: [Cloudstate.SideEffect.t()],
          state_action: Cloudstate.Crdt.CrdtStateAction.t() | nil
        }

  defstruct [:command_id, :side_effects, :state_action]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 27, 67, 114, 100, 116, 83, 116, 114, 101, 97, 109, 67, 97, 110, 99, 101, 108, 108,
        101, 100, 82, 101, 115, 112, 111, 110, 115, 101, 18, 29, 10, 10, 99, 111, 109, 109, 97,
        110, 100, 95, 105, 100, 24, 1, 32, 1, 40, 3, 82, 9, 99, 111, 109, 109, 97, 110, 100, 73,
        100, 18, 57, 10, 12, 115, 105, 100, 101, 95, 101, 102, 102, 101, 99, 116, 115, 24, 2, 32,
        3, 40, 11, 50, 22, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 83, 105, 100,
        101, 69, 102, 102, 101, 99, 116, 82, 11, 115, 105, 100, 101, 69, 102, 102, 101, 99, 116,
        115, 18, 67, 10, 12, 115, 116, 97, 116, 101, 95, 97, 99, 116, 105, 111, 110, 24, 3, 32, 1,
        40, 11, 50, 32, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116,
        46, 67, 114, 100, 116, 83, 116, 97, 116, 101, 65, 99, 116, 105, 111, 110, 82, 11, 115,
        116, 97, 116, 101, 65, 99, 116, 105, 111, 110>>
    )
  end

  field(:command_id, 1, type: :int64)
  field(:side_effects, 2, repeated: true, type: Cloudstate.SideEffect)
  field(:state_action, 3, type: Cloudstate.Crdt.CrdtStateAction)
end

defmodule Cloudstate.Crdt.Crdt.Service do
  @moduledoc false
  use GRPC.Service, name: "cloudstate.crdt.Crdt"

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.ServiceDescriptorProto.decode(
      <<10, 4, 67, 114, 100, 116, 18, 75, 10, 6, 104, 97, 110, 100, 108, 101, 18, 29, 46, 99, 108,
        111, 117, 100, 115, 116, 97, 116, 101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 83,
        116, 114, 101, 97, 109, 73, 110, 26, 30, 46, 99, 108, 111, 117, 100, 115, 116, 97, 116,
        101, 46, 99, 114, 100, 116, 46, 67, 114, 100, 116, 83, 116, 114, 101, 97, 109, 79, 117,
        116, 40, 1, 48, 1>>
    )
  end

  rpc(:handle, stream(Cloudstate.Crdt.CrdtStreamIn), stream(Cloudstate.Crdt.CrdtStreamOut))
end

defmodule Cloudstate.Crdt.Crdt.Stub do
  @moduledoc false
  use GRPC.Stub, service: Cloudstate.Crdt.Crdt.Service
end
