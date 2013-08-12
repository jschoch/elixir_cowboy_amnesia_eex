defmodule ElixirHelloWorld do
  #@before_compile {__MODULE__, Kernel.ParallelCompiler.files(["config/router.ex"]) }
  use Application.Behaviour
  alias Rooter, as: R
  def compile_routes do
  	Kernel.ParallelCompiler.files(["config/router.ex"])
 	:cowboy.set_env(:http_listener, :dispatch,R.gen_dispatch) 
  end
  def start(_type, _args) do
  	# :_ is special match for all hosts
  	# [{"/" matches root
    dispatch = R.gen_dispatch
    {:ok, _} = :cowboy.start_http(:http_listener, 100,
                                  [port: 8001],
                                  [env: [dispatch: dispatch]])
    ElixirHelloWorld.Supervisor.start_link
  end
end
