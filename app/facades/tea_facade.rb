class TeaFacade
    class << self
        def one_tea(name)
            data = TeaService.get_a_tea(name)

            TeaPoro.new(data)
        end
    end
end