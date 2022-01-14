class TeaPoro
  attr_reader :id,
              :name,
              :image,
              :description,
              :keywords,
              :origin,
              :brew_time,
              :temperature,
              :comments

  def initialize(data)
    @id = data[:_id]
    @name = data[:name]
    @image = data[:image]
    @description = data[:description]
    @keywords = data[:keywords]
    @origin = data[:origin]
    @brew_time = data[:brew_time]
    @temperature = data[:temperature]
    @comments = data[:comments]
  end
end
