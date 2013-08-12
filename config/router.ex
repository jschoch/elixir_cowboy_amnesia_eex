defmodule Rooter do
  #IO.puts "in Rooter"
  def gen_dispatch do
   :cowboy_router.compile([
      {:_, [
        {"/", ElixirHelloWorld.TopPageHandler, []},
        {"/foo",ElixirHelloWorld.FooPageHandler, []},   
      {"/tmpl",ElixirHelloWorld.TemplatePageHandler, []},
        {"/echo/:name/echo",EHW.EchoHandler, []},
        {"/unf1",ElixirHelloWorld.TopPageHandler, []},
      {"/trns",ElixirHelloWorld.TransactionTemplatePageHandler,[]}
    ]}
    ]) 
  end
end
