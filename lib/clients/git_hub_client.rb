class GitHubClient
  ROOT_ENDPOINT = "https://api.github.com"
  ACCESS_TOKEN = "71c0a16769994d9d1e20fbd89e5430c504b0d39c"

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post("/gists") do |request|
      request.headers["Authorization"] = "token #{ACCESS_TOKEN}"
      request.headers["Content-type"] = "application/json"
      request.body = params.to_json
    end
  end

  private 

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
