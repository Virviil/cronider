defmodule Cronider.Parser do

  @minutes 60
  @hours 24
  @months 12
  @days_of_month 31
  @days_of_week 7

  @doc """
  Generates cycled range from `lh` to `rh`. The cycle is defined by divisor `div`.

  ## Example 
  
    range (2,5,10) # 2..5
    range (5,2,10) # [5,6,7,8,9,0,1,2]
  """
  def range(lh, rh, _div) when lh < rh, do: lh..rh
  def range(lh, lh, div), do: 0..div-1
  def range(lh, rh, div), do: Enum.concat(lh..div-1, 0..rh)
  
  def parse(data) do
    data
    |> String.split(" ")
    |> Enum.zip([:minutes, :hours, :days_of_month, :months,  :days_of_week])
    |> Enum.map(
      fn {sigil, place} -> parse_sigil(sigil, place) end
    )
  end
  
  def parse_sigil(sigil, place) do
    do_parse(sigil|>String.split("-"), place)
  end
  
  def do_parse(["*"|[]], place) do
    case place do
      :minutes -> {place, 0..@minutes-1}
      :hours -> {place, 0..@hours-1}
      :months -> {place, 0..@months-1}
      :days_of_month -> {place, 0..@days_of_month-1}
      :days_of_week -> {place, 0..@days_of_week-1}
      _ -> raise "Wrong place."
    end
  end
  def do_parse([x|[]], place), do: {place, [String.to_integer(x)]}
  def do_parse([x| [y]], place) do
    [x,y] = Enum.map([x,y], &String.to_integer/1)
    case place do
      :minutes -> {place, range(x,y,@minutes)}
      :hours -> {place, range(x,y,@hours)}
      :months -> {place, range(x,y,@months)}
      :days_of_month -> {place, range(x,y,@days_of_month)}
      :days_of_week -> {place, range(x,y,@days_of_week)}
      _ -> raise "Wrong place."
    end
  end
  
end

