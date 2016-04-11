module Relations
  class Vote < ROM::Relation[:sql]
    dataset :votes

    def all_counts
      group_and_count(:character_id).order(:count)
    end
  end
end
