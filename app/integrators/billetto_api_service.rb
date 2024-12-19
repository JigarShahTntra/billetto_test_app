class BillettoApiService
  include HTTParty
  base_uri "https://billetto.dk/api/v3/public"

  def fetch_events
    api_key = Rails.application.credentials.dig(:billetto, :api_key)
    response = self.class.get("/events", headers: {
      "Api-Keypair" => api_key,
      "accept" => "application/json"
    })

    unless response.success?
      Rails.logger.error("Failed to fetch events: #{response.message}")
      raise "API Error: #{response.message}"
    end

    JSON.parse(response.body)["data"]
  end
end
