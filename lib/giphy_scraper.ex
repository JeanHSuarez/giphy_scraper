defmodule GiphyScraper do
  defdelegate search(query),
    to: DataProcessing.DataProcessing
end




