defmodule Nf2.Web.PageController do
  use Nf2.Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
