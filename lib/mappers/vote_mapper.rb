module Mappers
  class VoteMapper < ROM::Mapper
    model OpenStruct
    relation :votes
    register_as :entity
  end
end
