defmodule ElixirHelloWorld do
  use Application.Behaviour

  def start(_type, _args) do
  	# :_ is special match for all hosts
  	# [{"/" matches root
    dispatch = :cowboy_router.compile([
                 {:_, [
                 				{"/", ElixirHelloWorld.TopPageHandler, []},
                 				{"/foo",ElixirHelloWorld.FooPageHandler, []},		
                 				{"/tmpl",ElixirHelloWorld.TemplatePageHandler, []},
                 				{"/trns",ElixirHelloWorld.TransactionTemplatePageHandler,[]}
                 			]}
               ])
    {:ok, _} = :cowboy.start_http(:http, 100,
                                  [port: 8001],
                                  [env: [dispatch: dispatch]])
    ElixirHelloWorld.Supervisor.start_link
  end
end
