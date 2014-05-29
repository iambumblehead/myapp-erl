%%% -*- erlang -*-
%%%

-module(myapp_app).

-behaviour(application).

-export([start/2, stop/1]).

%%--------------------------------------------------------------------
%% Func: start/2
%% Returns: {ok, Pid}        |
%%          {ok, Pid, State} |
%%          {error, Reason}
%%--------------------------------------------------------------------
start(_StartType, _StartArgs) ->
    myapp_util:start_app_deps(myapp),
    myapp_sup:start_link().

%%--------------------------------------------------------------------
%% Func: stop/1
%% Returns: any
%%--------------------------------------------------------------------
stop(_State) ->
    ok.
