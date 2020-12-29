defmodule GiphyScraper do

  def search(query) do
    query = to_string(query)
    fetched_data = GetApiData.request_data(query)
    result = Jason.decode!(fetched_data)
    %{"data" => value} = result
    Enum.map(value, fn v -> DataParser.data_extractor(v) end)
  end
end
