defmodule ParserTest do
  use ExUnit.Case
  doctest Cronider.Parser
  
  import Cronider.Parser

  test "generate range" do
    assert range(3,5,24) == 3..5
    assert range(22,2,24) == [22,23,0,1,2]
    assert range(22,22,24) == 0..23
    assert range(1,5,60) == 1..5
    assert range(58,2,60) == [58,59,0,1,2]
    assert range(3,3,60) == 0..59
  end
  
  test "parse_sigil range for minutes" do
    assert parse_sigil("3-5", :minutes) == {:minutes, 3..5}
    assert parse_sigil("58-3", :minutes) == {:minutes, [58,59,0,1,2,3]}
    assert parse_sigil("58", :minutes) == {:minutes, [58]}
    assert parse_sigil("*", :minutes) == {:minutes, 0..59}
  end
  
  test "parse_sigil range for hours" do
    assert parse_sigil("3-5", :hours) == {:hours, 3..5}
    assert parse_sigil("23-3", :hours) == {:hours, [23,0,1,2,3]}
    assert parse_sigil("22", :hours) == {:hours, [22]}
    assert parse_sigil("*", :hours) == {:hours, 0..23}
  end

  test "parse_sigil range for months" do
    assert parse_sigil("3-5", :months) == {:months, 3..5}
    assert parse_sigil("10-3", :months) == {:months, [10,11,0,1,2,3]}
    assert parse_sigil("11", :months) == {:months, [11]}
    assert parse_sigil("*", :months) == {:months, 0..11}
  end
end
