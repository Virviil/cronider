# Cronider

Crontab intervals library for Elixir. Intervals can be set up in [crontab](https://en.wikipedia.org/wiki/Cron#CRON_expression) notation, after that any particular time can be checked in colliding with this interval.

# Usage

```bash
> ip1 = Cronider.IntervalPart.from_crontab("1 * * * *")
%Cronider.IntervalPart{days_of_month: 0..30, days_of_week: 0..6, hours: 0..23,
    minutes: [1], months: 0..11}
> ip2 = Cronider.IntervalPart.from_crontab("* 1 * * *")
%Cronider.IntervalPart{days_of_month: 0..30, days_of_week: 0..6, hours: [1],
    minutes: 0..59, months: 0..11}
> Cronider.Interval.from_parts([ip1, ip2])
%Cronider.Interval{parts: [...]}
> q |> Cronider.Interval.member?({{2016,1,1},{1,2,3}})
true
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `cronider` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:cronider, "~> 0.1.0"}]
    end
    ```

  2. Ensure `cronider` is started before your application:

    ```elixir
    def application do
      [applications: [:cronider]]
    end
    ```

