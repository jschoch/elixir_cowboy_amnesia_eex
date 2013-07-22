Elixir Hello World
==================

This is an example of running Cowboy with [Elixir](http://elixir-lang.org).

You need Elixir installed
([instructions here](http://elixir-lang.org/getting_started/1.html))
to run this example. After installing Elixir, you should have both
`elixir` and `mix` executables available.

You also need [rebar](https://github.com/rebar/rebar) in your PATH
to compile dependencies.

Then type the following command:

```
mix deps.get
```

The command above will fetch all dependencies and compile them.

You can then start the Erlang node with the following command:

```
iex -S mix
iex(1)> Amnesia.start
:ok
iex(2)>DBA.install
:ok
```

Then point your browser to localhost:8080.

Example
-------

``` bash
$ curl -i http://localhost:8001/
HTTP/1.1 200 OK
connection: keep-alive
server: Cowboy
date: Mon, 22 Jul 2013 00:24:55 GMT
content-length: 18

from the db doods!
```

##example of a route for /foo
lib/elixir_hello_world/foo_page_handler.ex
```
curl -i localhost:8001/foo
HTTP/1.1 200 OK
connection: keep-alive
server: Cowboy
date: Mon, 22 Jul 2013 00:25:21 GMT
content-length: 7

foo!!!!
```
##example of a EEx template
lib/elixir_hello_world/template_page_handler.ex
```
curl -i localhost:8001/tmpl
HTTP/1.1 200 OK
connection: keep-alive
server: Cowboy
date: Mon, 22 Jul 2013 00:25:52 GMT
content-length: 128

<html>
  <head></head>
  <body>
    <div id="menu">Menu</div>
    <div id="content">
      unf!!!!
    </div>
  </body>
</html>
```
