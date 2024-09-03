-module(mongoose_graphql_enum).

-export([input/2, output/2]).

-ignore_xref([input/2, output/2]).

input(<<"PresenceShow">>, Show) ->
    {ok, list_to_binary(string:to_lower(binary_to_list(Show)))};
input(<<"PresenceType">>, Type) ->
    {ok, list_to_binary(string:to_lower(binary_to_list(Type)))};
input(<<"Affiliation">>, <<"OWNER">>) -> {ok, owner};
input(<<"Affiliation">>, <<"MEMBER">>) -> {ok, member};
input(<<"Affiliation">>, <<"NONE">>) -> {ok, none};
input(<<"AddressTags">>, Name) -> {ok, Name};
input(<<"BlockingAction">>, <<"ALLOW">>) -> {ok, allow};
input(<<"BlockingAction">>, <<"DENY">>) -> {ok, deny};
input(<<"BlockedEntityType">>, <<"USER">>) -> {ok, user};
input(<<"BlockedEntityType">>, <<"ROOM">>) -> {ok, room};
input(<<"EmailTags">>, Name) -> {ok, Name};
input(<<"SubAction">>, <<"INVITE">>) -> {ok, invite};
input(<<"SubAction">>, <<"ACCEPT">>) -> {ok, accept};
input(<<"SubAction">>, <<"DECLINE">>) -> {ok, decline};
input(<<"SubAction">>, <<"CANCEL">>) -> {ok, cancel};
input(<<"MutualSubAction">>, <<"CONNECT">>) -> {ok, connect};
input(<<"MutualSubAction">>, <<"DISCONNECT">>) -> {ok, disconnect};
input(<<"MUCRole">>, <<"VISITOR">>) -> {ok, visitor};
input(<<"MUCRole">>, <<"PARTICIPANT">>) -> {ok, participant};
input(<<"MUCRole">>, <<"MODERATOR">>) -> {ok, moderator};
input(<<"MUCAffiliation">>, <<"NONE">>) -> {ok, none};
input(<<"MUCAffiliation">>, <<"MEMBER">>) -> {ok, member};
input(<<"MUCAffiliation">>, <<"OUTCAST">>) -> {ok, outcast};
input(<<"MUCAffiliation">>, <<"ADMIN">>) -> {ok, admin};
input(<<"MUCAffiliation">>, <<"OWNER">>) -> {ok, owner};
input(<<"PrivacyClassificationTags">>, Name) -> {ok, Name};
input(<<"TelephoneTags">>, Name) -> {ok, Name};
input(<<"LogLevel">>, Name) -> {ok, list_to_atom(string:to_lower(binary_to_list(Name)))};
input(<<"MetricType">>, Name) -> {ok, Name}.

output(<<"DomainStatus">>, Type) ->
    {ok, list_to_binary(string:to_upper(atom_to_list(Type)))};
output(<<"PresenceShow">>, Show) ->
    {ok, list_to_binary(string:to_upper(binary_to_list(Show)))};
output(<<"PresenceType">>, Type) ->
    {ok, list_to_binary(string:to_upper(binary_to_list(Type)))};
output(<<"AuthStatus">>, Status) ->
    {ok, atom_to_binary(Status, utf8)};
output(<<"AuthType">>, Type) ->
    {ok, list_to_binary(string:to_upper(atom_to_list(Type)))};
output(<<"Affiliation">>, Aff) ->
    {ok, list_to_binary(string:to_upper(atom_to_list(Aff)))};
output(<<"BlockingAction">>, Action) ->
    {ok, list_to_binary(string:to_upper(atom_to_list(Action)))};
output(<<"BlockedEntityType">>, What) ->
    {ok, list_to_binary(string:to_upper(atom_to_list(What)))};
output(<<"ContactSub">>, Type) when Type =:= both;
                                    Type =:= from;
                                    Type =:= to;
                                    Type =:= none ->
    {ok, list_to_binary(string:to_upper(atom_to_list(Type)))};
output(<<"ContactAsk">>, Type) when Type =:= subscrube;
                                    Type =:= unsubscribe;
                                    Type =:= in;
                                    Type =:= out;
                                    Type =:= both;
                                    Type =:= none ->
    {ok, list_to_binary(string:to_upper(atom_to_list(Type)))};
output(<<"MUCRole">>, Role) ->
    {ok, list_to_binary(string:to_upper(atom_to_list(Role)))};
output(<<"MUCAffiliation">>, Aff) ->
    {ok, list_to_binary(string:to_upper(atom_to_list(Aff)))};
output(<<"AddressTags">>, Name) -> {ok, Name};
output(<<"EmailTags">>, Name) -> {ok, Name};
output(<<"PrivacyClassificationTags">>, Name) -> {ok, Name};
output(<<"LogLevel">>, Name) -> {ok, list_to_binary(string:to_upper(atom_to_list(Name)))};
output(<<"TelephoneTags">>, Name) -> {ok, Name};
output(<<"MetricType">>, Type) -> {ok, Type};
output(<<"StatusCode">>, Code) -> {ok, Code}.
