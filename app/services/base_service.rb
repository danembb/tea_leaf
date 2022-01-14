class BaseService
  class << self
    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn(url)
      Faraday.new(url)
    end
  end
end
