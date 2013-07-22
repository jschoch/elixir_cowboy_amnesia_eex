defmodule ElixirHelloWorld.TransactionTemplatePageHandler do
	use Amnesia
	@page """
<html>
  <head></head>
  <body>
    <div id="menu">Menu</div>
    <div id="content">
      <%= @unf %>
      <%= @time %>
    </div>
  </body>
</html>
"""
	
  def init(_transport, req, []) do
    Amnesia.transaction do
    	DB.Tbl[id: 3, name: "snusnu!!!!"].write
    end
    {:ok, req, nil}
  end

  def handle(req, state) do
  	{:atomic, name} = Amnesia.transaction do
  		DB.Tbl.read(3).name	
  	end
    render = EEx.eval_string @page, assigns: [unf: name, time: (inspect :erlang.now)]
    {:ok, req} = :cowboy_req.reply(200, [], render, req)
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end
