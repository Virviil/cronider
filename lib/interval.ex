defmodule Cronider.Interval do
  defstruct parts: []
  
  def member?(interval, {{ye, mo, dm}, {ho, mi, _se}}) do
  interval.parts
  |> Enum.any?(&(&1 |> Cronider.IntervalPart.member?({mi, ho, dm, mo, {ye, mo, dm} |> :calendar.day_of_the_week})))
  end
end