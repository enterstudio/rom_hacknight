Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :name, :null=>false
      Integer :uid, :null=>false
    end

    create_table(:votes) do
      primary_key :id
      Integer :character_id
      Integer :user_id
    end

    create_table(:characters) do
      primary_key :id
      String :name
    end
  end
end
