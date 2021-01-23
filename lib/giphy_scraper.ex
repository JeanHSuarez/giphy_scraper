defmodule GiphyScraper do
  defdelegate search(query),
    to: DataParser.PreProcessing
end




