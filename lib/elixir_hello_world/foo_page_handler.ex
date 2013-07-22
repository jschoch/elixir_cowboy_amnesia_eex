defmodule ElixirHelloWorld.FooPageHandler do
  def init(_transport, req, []) do
    DB.Tbl[id: 1, name: "foo!!!!"].write!
    {:ok, req, nil}
  end

  def handle(req, state) do
    {:ok, req} = :cowboy_req.reply(200, [], DB.Tbl.read!(1).name, req)
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end
