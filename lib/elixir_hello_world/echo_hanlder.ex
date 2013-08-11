defmodule EHW.EchoHandler do
  def init(_transport, req, []) do
    {:ok, req, nil}
  end

  def handle(req, state) do
    require :cowboy_req, as: R
    {method,req} = R.method(req)
    { query_string, req } = R.qs(req)
    {thing, req} = R.qs_val("foo",req)
    #{foo, req} = R.
    params = Dynamo.Connection.QueryParser.parse(query_string)
    response = """
      <html><body><p>
      test urls = [/qs_echo?foo[bar]=1, /qs_echo?foo=1] </br>
      Method: #{method}</br>
      Query String: #{inspect query_string}</br>
      ?foo=1: #{thing}</br>
      params: #{inspect params}</br>
      foo[bar] from params #{params["foo"]["bar"]}</br>
      Request: #{inspect req}
      </p></html></body>
"""
    {:ok, req} = :cowboy_req.reply(200, [], response, req)
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end
