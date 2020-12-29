defmodule GetApiData do

  def request_data(api_key, entry_limit) do
    response = HTTPoison.get! "https://api.giphy.com/v1/gifs/search?api_key=#{api_key}&q=search&limit=#{entry_limit}&offset=0&rating=g&lang=en"
    HTTPoison.Handlers.Multipart.decode_body(response)
  end

end
