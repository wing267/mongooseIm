-module(assert_helper).
-export([transform_extra/1]).

%% If Extra is a map, format each field.
%% It enables smarter term truncation.
transform_extra(Extra) when is_map(Extra) ->
    %% for small maps ordering of map fields would be preserved,
    %% which is good for debugging (because it helps to match code and output)
    ExtraArgs = maps:fold(fun(MK, MV, A) -> A ++ [MK, MV] end, [], Extra),
    ExtraFmt = lists:append(lists:duplicate(maps:size(Extra), "~n\t~p = ~p")),
    lists:flatten(io_lib:format(ExtraFmt, ExtraArgs, [{chars_limit, 25000}]));
transform_extra(Extra) ->
    lists:flatten(io_lib:format("~n\tExtra ~p", Extra, [{chars_limit, 25000}])).
