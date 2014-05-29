
-module(myapp_reqhandler).
-author('bumblehead <chris@bumblehead.com>').

-export([out/1]).

out(Arg) ->
    {html, "Funky Stuff"}.
