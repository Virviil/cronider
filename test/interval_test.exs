defmodule IntervalTest do
  use ExUnit.Case
  doctest Cronider.Parser
  
  import Cronider.IntervalPart
  
  test "interval part convertion from list" do
  end
  
  test "membrance" do
    int = %Cronider.IntervalPart{days_of_month: 0..30, days_of_week: 0..6, hours: 12..23, minutes: 0..59, months: 0..11}
    assert int |> member?({0,12,0,0,0}) == true
    assert int |> member?({0,11,0,0,0}) == false
  end
  
  test "memmbrance" do
    int1 = %Cronider.IntervalPart{days_of_month: 0..30, days_of_week: 0..6, hours: 12..23, minutes: 0..59, months: 0..11}
    int2 = %Cronider.IntervalPart{days_of_month: 0..30, days_of_week: 0..6, hours: 0..11, minutes: 0..59, months: 0..11}
    assert int2 |> member?({0,12,0,0,0}) == false
    assert int1 |> member?({0,11,0,0,0}) == false
    int = %Cronider.Interval{parts: [int1,int2]}
    assert int |> Cronider.Interval.member?({{2016, 1, 1}, {11, 0, 0}}) == true
    assert int |> Cronider.Interval.member?({{2016, 1, 1}, {12, 0, 0}}) == true
  end
end
