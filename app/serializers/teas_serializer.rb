class TeasSerializer
  include JSONAPI::Serializer
  attributes :name, :image, :description, :keywords, :origin, :brew_time, :temperature
  # class << self
  #   def new(tea)
  #     {
  #       "data": {
  #         "id": tea.id,
  #         "name": tea.name,
  #         "image": tea.image,
  #         "description": tea.description,
  #         "keywords": tea.keywords,
  #         "origin": tea.origin,
  #         "brew_time": tea.brew_time,
  #         "temperature": tea.temperature
  #       }
  #     }
  #   end
  # end
end
