myapp-erl
=========
**(c)[Bumblehead][0], 2014** [MIT-license](#license)

### OVERVIEW:

`myapp` is a 'hello world' style OTP application to demonstrate usage of rebar, couchbeam and (embedded) yaws. Because it is called 'myapp' it is easy to map the filenames to those used in examples in documents for yaws and other erlang modules.

Building an application with embedded yaws at present requires one to `export YAWS_DISABLE_PAM=1`.

To build the application:
```bash
$ cd path/to/myapp
$ rebar get-deps
$ rebar compile
```

Then start the erlang shell and then the application. Visit localhost:8080 to see a test response or start calling methods from the shell:
```bash
$ erl -pa ebin deps/*/ebin
Erlang R16B03 (erts-5.10.4) [source] [64-bit] [smp:4:4] [async-threads:10] [kernel-poll:false]

Eshell V5.10.4  (abort with ^G)
1> myapp:start().

=INFO REPORT==== 28-May-2014::19:52:27 ===
Yaws: Listening to 127.0.0.1:8080 for <1> virtual servers:
 - http://localhost:8080 under ./www
{ok,<0.33.0>}
2> myapp:hello_world().
hello, world 5
ok
3> 
```

For development -Emacs in combination with `projmake-mode`.

After saving files, `projmake-mode` automatically creates a beam file and the 'reloader' tool from mochiweb sources, saved locally and configured, can auto-reload new beam files that appear.
```bash
3> reloader:start().
{ok,<0.80.0>}
4>
```

If using emacs' ansi-shell, it may not be necessary to leave emacs.

The skeleton of the application was generated from rebar and much of the rest filled in through reference of couchbeam and some structural idioms it uses.


[0]: http://www.bumblehead.com                      "bumblehead"
[1]: https://github.com/benoitc/couchbeam            "couchbeam"
[2]: https://github.com/benoitc/erica                    "erica"
---------------------------------------------------------
#### <a id="license">License:

![scrounge](https://github.com/iambumblehead/scroungejs/raw/master/img/hand.png) 

(The MIT License)

Copyright (c) 2014 [Bumblehead][0] <chris@bumblehead.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
