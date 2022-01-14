class TeaFacade
    class << self
        def one_tea(name)
            response = TeaService.get_a_tea(name)
        
            Tea.new(response)
        end
    end
end