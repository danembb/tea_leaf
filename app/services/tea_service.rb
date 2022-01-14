class TeaService
  class << self
    def get_a_tea(name)
      response = BaseService.conn('https://tea-api-vic-lo.herokuapp.com/').get("/tea/#{name}") do |req|
        req.params['name']
      end
      BaseService.parse_json(response)
    end
  end
end
