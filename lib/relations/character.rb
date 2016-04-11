module Relations
  class Character < ROM::Relation[:sql]
    dataset :characters

    def find_by_id(id)
      where(id: id)
    end
  end
end
