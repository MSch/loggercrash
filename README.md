Loggertest
==========

1. `git clean -fdx`
2. `mix deps.get`
3. `iex -S mix` Notice how the Logger logs the error before shutdown
4. `mix release && cd rel/loggertest && bin/loggertest console` Notice how Logger crashes
