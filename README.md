Elixir Hello World
==================

This is an example of running Cowboy with [Elixir](http://elixir-lang.org) and 
[Amnesia](https://github.com/meh/amnesia) and [EEx](http://elixir-lang.org/docs/master/EEx.html)

You need Elixir installed
([instructions here](http://elixir-lang.org/getting_started/1.html))


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

## also there is an Amnesia transaciton test

quick micro bench on m1.medium

ab -c 10 -n 10000 http://ec2-xyz.compute-1.amazonaws.com:8001/trns
This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking ec2-xyz.compute-1.amazonaws.com (be patient)
Completed 1000 requests
Completed 2000 requests
Completed 3000 requests
Completed 4000 requests
Completed 5000 requests
Completed 6000 requests
Completed 7000 requests
Completed 8000 requests
Completed 9000 requests
Completed 10000 requests
Finished 10000 requests


Server Software:
Server Hostname:        ec2-xyz.compute-1.amazonaws.com
Server Port:            8001

Document Path:          /trns
Document Length:        160 bytes

Concurrency Level:      10
Time taken for tests:   12.444 seconds
Complete requests:      10000
Failed requests:        965
   (Connect: 0, Receive: 0, Length: 965, Exceptions: 0)
Write errors:           0
Total transferred:      2528915 bytes
HTML transferred:       1598915 bytes
Requests per second:    803.60 [#/sec] (mean)
Time per request:       12.444 [ms] (mean)
Time per request:       1.244 [ms] (mean, across all concurrent requests)
Transfer rate:          198.46 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       3
Processing:     1   12   8.7     12      87
Waiting:        0   12   8.7     11      87
Total:          1   12   8.7     12      87

Percentage of the requests served within a certain time (ms)
  50%     12
  66%     14
  75%     16
  80%     16
  90%     20
  95%     26
  98%     43
  99%     50
 100%     87 (longest request)

