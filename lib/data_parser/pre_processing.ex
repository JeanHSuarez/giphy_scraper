
defmodule DataParser.PreProcessing do
		
	def search(anything) do
		user_input = URI.encode(anything)
		api_key = Application.get_env(:giphy_scraper, :api_key)
		url = "https://api.giphy.com/v1/gifs/search?api_key=#{api_key}&q=#{user_input}&limit=25&offset=0&rating=g&lang=en"

		case HTTPoison.get(url) do
			{:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
				%{"data" => value} = body |> Jason.decode! 
				value |> Enum.map(fn v -> populate_struct(v) end)
			{:ok, %HTTPoison.Response{status_code: 404}} ->
			  {:ok, response} = {:ok, %HTTPoison.Response{status_code: 404}}
			  response
			{:error, %HTTPoison.Error{reason: reason}} ->
			  {:error, reason} = {:error, %HTTPoison.Error{reason: reason}}
			  reason
		  end
	end

	def populate_struct(%{"id" => id, "url" => url, "username" => username, "title" => title}) do
		%GiphyImage{id: id, url: url, username: username, title: title}
	end
	
end