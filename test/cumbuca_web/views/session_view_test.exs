defmodule CumbucaWeb.SessionViewTest do
  use CumbucaWeb.ConnCase
  alias CumbucaWeb.SessionView

  @error_message "Não foi possivel fazer login"

  describe "Registro de Session:" do
    test "error.json" do
      assert SessionView.render("error.json", message: @error_message) == %{
               data: "Não foi possivel fazer login"
             }
    end
  end
end
