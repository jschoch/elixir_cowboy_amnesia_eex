defmodule Tmpl do
   @page """
<html>
  <head></head>
  <body>
    WOOT
    <div id="menu">Menu</div>
    <div id="content">
      <%= @unf %>
      <%= @time %>
    </div>
  </body>
</html>
"""
  require EEx
  EEx.function_from_string(:def,:rndr,@page,[:assigns])
end


defmodule ElixirHelloWorld.TemplatePageHandler do
  def init(_transport, req, []) do
    DB.Tbl[id: 2, name: "unf!!!!"].write!
    {:ok, req, nil}
  end

  def handle(req, state) do
    #{:ok, req} = :cowboy_req.reply(200, [], DB.Tbl.read!(2).name, req)
    name = DB.Tbl.read!(2).name
    #render = EEx.eval_string @page, assigns: [unf: name, time: (inspect :erlang.now)]
    render = Tmpl.rndr(unf: name, time:  (inspect :erlang.now))
    {:ok, req} = :cowboy_req.reply(200, [], render, req)
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end
