defmodule GiphyScraper do

  def search(api_key, request_limit) do
    my_key = api_key
    my_limit = request_limit
    GetApiData.request_data(my_key, my_limit)
    result = Jason.decode!(GetApiData.request_data(my_key, my_limit))
    %{"data" => value} = result
    Enum.map(value, fn v -> DataParser.data_extractor(v) end)
  end
end
