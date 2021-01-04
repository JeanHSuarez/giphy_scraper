defmodule GiphyImage do
	defstruct [id: "default_id", url: "default_url", username: "default_username", title: "default_title"]
end

defmodule DataProcessing.DataProcessing do
		
	def search(anything) do
		api_key = Application.get_env(:giphy_scraper, :api_key)
		%{"data" => value} = "https://api.giphy.com/v1/gifs/search?api_key=#{api_key}&q=#{anything}&limit=25&offset=0&rating=g&lang=en" 
		|> HTTPoison.get!
		|> HTTPoison.Handlers.Multipart.decode_body
		|> Jason.decode! 
		value
		|> Enum.map(fn v -> populate_struct(v) end)
	end

	def populate_struct(%{"id" => id, "url" => url, "username" => username, "title" => title}) do
		%GiphyImage{id: to_string(id), url: to_string(url), username: to_string(username), title: to_string(title)}
	end
	
end