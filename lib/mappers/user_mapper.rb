module Mappers
  class UserMapper < ROM::Mapper
    model OpenStruct
    relation :users
    register_as :entity
  end
end
