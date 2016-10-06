defmodule Cronider.Interval do
  defstruct parts: []
  
  @doc """
  Represents, if the given date collides with given date
  """
  def member?(interval, {{ye, mo, dm}, {ho, mi, _se}}) do
  interval.parts
  |> Enum.any?(&(&1 |> Cronider.IntervalPart.member?({mi, ho, dm, mo, {ye, mo, dm} |> :calendar.day_of_the_week})))
  end

  @doc """
  Generate new instance of interval from interval parts
  """
  def from_parts(parts_list), do: %Cronider.Interval{parts: parts_list}
end

