defmodule ElixirHelloWorld.TemplatePageHandler do
	@page """
<html>
  <head></head>
  <body>
    <div id="menu">Menu</div>
    <div id="content">
      <%= @unf %>
    </div>
  </body>
</html>
"""
	
  def init(_transport, req, []) do
    DB.Tbl[id: 2, name: "unf!!!!"].write!
    {:ok, req, nil}
  end

  def handle(req, state) do
    #{:ok, req} = :cowboy_req.reply(200, [], DB.Tbl.read!(2).name, req)
    name = DB.Tbl.read!(2).name
    render = EEx.eval_string @page, assigns: [unf: name]
    {:ok, req} = :cowboy_req.reply(200, [], render, req)
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end
