defmodule DataParser do

  def data_extractor(%{"id" => id, "url" => url, "username" => username, "title" => title}) do
    %{"id" => id, "url" => url, "username" => username, "title" => title}
  end

end
