-module(list_presets).
-export([main/0]).
-export([main/1]).

main() ->
    main([]).

main(_) ->
    print_presets(read_presets()),
    erlang:halt().

-spec read_presets() -> [atom()].
read_presets() ->
    {ok, Config} = file:consult("big_tests/test.config"),
    Presets = proplists:get_value(presets, Config, []),
    Toml = proplists:get_value(toml, Presets, []),
    lists:map(fun({Name,_}) -> Name end, Toml).

print_presets(PresetNames) ->
    [io:format("~p~n", [P]) || P <- PresetNames].
