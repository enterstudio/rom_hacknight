module Commands
  class UpsertUser < ROM::Commands::Create[:sql]
    relation :users
    register_as :upsert
    result :one

    def execute(tuple)
      [upsert_user(tuple)]
    end

    private

    def upsert_user(tuple)
      user = relation.where(uid: tuple[:uid]).call.one

      if user
        relation.dataset.where(uid: tuple[:uid]).update(tuple)
        user.merge(tuple)
      else
        id = relation.dataset.insert(tuple)
        {id: id}.merge(tuple)
      end
    end
  end
end
