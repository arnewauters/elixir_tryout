defmodule Nf2.Web.ErrorViewTest do
  use Nf2.Web.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(Nf2.Web.ErrorView, "404.html", []) ==
           "Page not found"
  end

  test "render 500.html" do
    assert render_to_string(Nf2.Web.ErrorView, "500.html", []) ==
           "Server internal error"
  end

  test "render any other" do
    assert render_to_string(Nf2.Web.ErrorView, "505.html", []) ==
           "Server internal error"
  end
end
