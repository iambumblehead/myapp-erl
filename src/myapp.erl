%%% -*- erlang -*-

-module(myapp).
-author('bumblehead <chris@bumblehead.com>').

-include("../include/myapp.hrl").

-export([start/0, stop/0, version/0]).
-export([hello_world/0, couchbeam_test/0]).
-export([out/1]).

-define(DOCROOT, "./na/www").

%% --------------------------------------------------------------------
%% Generic utilities.
%% --------------------------------------------------------------------

%% @doc Start the myapp process. Useful when testing using the shell.
%% follows the technique found here:
%% https://github.com/benoitc/couchbeam/blob/master/src/couchbeam.erl
start() ->
    myapp_deps:ensure(),
    application:load(myapp),
    myapp_util:start_app_deps(myapp),
    application:start(myapp),

    Id = "erlark",
    GconfList = [{logdir, "./log/erlark"},
                 {ebin_dir, ["./ebin"]},
                 {id, Id}],
    Docroot = "./www",
    SconfList = [{docroot, Docroot},
                 {port, 8080},
                 {dir_listings, true},
                 {listen, {127,0,0,1}},
                 {appmods, [{"/", myapp_reqhandler}]}],
    {ok, SCList, GC, ChildSpecs} =
        yaws_api:embedded_start_conf(Docroot, SconfList, GconfList, Id),

    %% assume our supervisor is registered as my_sup
    [supervisor:start_child(myapp_sup, Ch) || Ch <- ChildSpecs],

    %% now configure Yaws
    yaws_api:setconf(GC, SCList),
    {ok, self()}.

%% @doc Stop the couchbeam process. Useful when testing using the shell.
stop() ->
    application:stop(myapp).


out(Arg) ->
    {html, "Funky Stuff"}.


%% @spec () -> Version
%%     Version = string()
%% @doc Return the version of the application.
version() ->
    {ok, Version} = application:get_key(couchbeam, vsn),
    Version.

hello_world() -> 
    io:fwrite("hello, world 5\n").

couchbeam_test() -> 
    Url = "http://localhost:5984",
    Options = [],
    S = couchbeam:server_connection(Url, Options),
    {ok, _Version} = couchbeam:server_info(S).
%    io:fwrite("yay").
%    if
%        couchbeam:db_exists(S, "test") ->
%            io:fwrite(" does not exist \n");
%        true -> % works as an 'else' branch
%            io:fwrite(" does exist \n")
%    end.
