module Mappers
  class CharacterMapper < ROM::Mapper
    model OpenStruct
    relation :characters
    register_as :entity
  end
end
