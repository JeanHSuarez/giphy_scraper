require GiphyImage

defmodule DataProcessing.DataProcessing do
		
	def search(anything) do
		user_input = URI.encode(anything)
		api_key = System.get_env("API_KEY")
		url = "https://api.giphy.com/v1/gifs/search?api_key=#{api_key}&q=#{user_input}&limit=25&offset=0&rating=g&lang=en"

		case HTTPoison.get(url) do
			{:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
				%{"data" => value} = body |> Jason.decode! 
				value |> Enum.map(fn v -> populate_struct(v) end)
			{:ok, %HTTPoison.Response{status_code: 404}} ->
			  ["Sorry, Page Not Found"]
			{:error, %HTTPoison.Error{reason: reason}} ->
			  ["Error: #{reason}"]
		  end
	end

	def populate_struct(%{"id" => id, "url" => url, "username" => username, "title" => title}) do
		%GiphyImage{id: to_string(id), url: to_string(url), username: to_string(username), title: to_string(title)}
	end
	
end