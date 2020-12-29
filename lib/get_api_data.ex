defmodule GetApiData do


  def request_data(anything) do
    response = HTTPoison.get!"https://api.giphy.com/v1/gifs/search?api_key=tbH6BNzvYf6c2chgNl3kLIAmPa4r8iFZ&q=#{anything}&limit=25&offset=0&rating=g&lang=en"
    HTTPoison.Handlers.Multipart.decode_body(response)
  end

end
