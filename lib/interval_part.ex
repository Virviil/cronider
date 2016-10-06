defmodule Cronider.IntervalPart do
  defstruct minutes: [], hours: [], days_of_month: [], months: [], days_of_week: []
    
  def from_list(list) do
    struct(%Cronider.IntervalPart{}, list)
  end

  def from_crontab(crontab) do
    from_list(Cronider.Parser.parse(crontab))
  end
  
  def member?(part, {mi, ho, dm, mo, dw}) do
    with true <- part.minutes |> Enum.member?(mi),
      true <- part.hours |> Enum.member?(ho),
      true <- part.days_of_month |> Enum.member?(dm),
      true <- part.months |> Enum.member?(mo),
      true <- part.days_of_week |> Enum.member?(dw),
    do: true
  end
end

