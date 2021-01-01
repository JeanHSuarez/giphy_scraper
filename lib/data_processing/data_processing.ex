defmodule GiphyImage do
	defstruct [id: "default_id", url: "default_url", username: "default_username", title: "default_title"]
end

defmodule DataProcessing.DataProcessing do
	def request_data(anything) do
		response = HTTPoison.get!"https://api.giphy.com/v1/gifs/search?api_key=tbH6BNzvYf6c2chgNl3kLIAmPa4r8iFZ&q=#{anything}&limit=25&offset=0&rating=g&lang=en"
		HTTPoison.Handlers.Multipart.decode_body(response)
	end

	def populate_struct(%{"id" => id, "url" => url, "username" => username, "title" => title}) do
		%GiphyImage{id: to_string(id), url: to_string(url), username: to_string(username), title: to_string(title)}
	end

	def search(query) do
		fetched_data = request_data(query)
		result = Jason.decode!(fetched_data)
		%{"data" => value} = result
		Enum.map(value, fn v -> populate_struct(v) end)
	end
end