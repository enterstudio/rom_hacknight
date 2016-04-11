module Commands
  class CreateVote < ROM::Commands::Create[:sql]
    relation :votes
    register_as :create
  end
end
