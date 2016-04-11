module Relations
  class User < ROM::Relation[:sql]
    dataset :users

    def find_by_id(id)
      where(id: id)
    end
  end
end
