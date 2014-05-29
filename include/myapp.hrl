
-define(USER_AGENT, "myapp/0.0.1").

%% this is a .hrl (header) file.
-record(included, {some_field,
                   some_default = "yeah!",
                   unimaginative_name}).
