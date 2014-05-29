%%% -*- erlang -*-
%%%
%%% This file is part of bango released under the MIT license.
%%% See the NOTICE for more information.

-module(myapp_util).

-export([start_app_deps/1, get_app_env/2]).

%% @spec start_app_deps(App :: atom()) -> ok
%% @doc Start depedent applications of App.
start_app_deps(App) ->
    {ok, DepApps} = application:get_key(App, applications),
    [ensure_started(A) || A <- DepApps],
    ok.

%% @spec ensure_started(Application :: atom()) -> ok
%% @doc Start the named application if not already started.
ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.

get_app_env(Env, Default) ->
    case application:get_env(myapp, Env) of
        {ok, Val} -> Val;
        undefined -> Default
    end.
